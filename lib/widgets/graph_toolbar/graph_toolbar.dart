import 'package:flutter/material.dart';
import '../../models/graph_toolbar_style.dart';

// 툴바에 추가할 버튼 하나를 정의하는 데이터 클래스
// onTap에 BuildContext를 전달하므로 Provider 등 위젯 트리 접근 가능
class GraphToolbarAction {
  final IconData icon;
  final String tooltip;

  /// 버튼 클릭 시 호출. context로 Provider 값 읽기 등 자유롭게 사용 가능
  /// 예: (ctx) => ctx.read`<EditorState>`().jsonText
  final void Function(BuildContext context) onTap;

  const GraphToolbarAction({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });
}

// 그래프 패널 하단 툴바
// 기본 줌 버튼(fit / - / +) 고정 + extraActions로 버튼 자유 추가
class GraphToolbar extends StatelessWidget {
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;
  final VoidCallback onFit;

  /// 에디터 패널 접기/펼치기 콜백. null이면 버튼 미표시.
  final VoidCallback? onToggleEditorPanel;

  /// 검색 토글 콜백. null이면 버튼 미표시.
  final VoidCallback? onToggleSearch;

  /// 검색 활성 여부 (검색 버튼 강조 표시에 사용)
  final bool searchActive;

  /// 사용자 정의 버튼 목록. 기본 줌 버튼 오른쪽에 구분선과 함께 추가됨
  final List<GraphToolbarAction> extraActions;

  final GraphToolbarStyle style;

  const GraphToolbar({
    super.key,
    required this.onZoomIn,
    required this.onZoomOut,
    required this.onFit,
    this.onToggleEditorPanel,
    this.onToggleSearch,
    this.searchActive = false,
    this.extraActions = const [],
    this.style = const GraphToolbarStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: style.containerPadding,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(style.borderRadius),
        boxShadow: [
          BoxShadow(
            color: style.shadowColor,
            blurRadius: style.shadowBlurRadius,
            offset: style.shadowOffset,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 에디터 패널 토글 버튼 (콜백이 있을 때만 표시)
          if (onToggleEditorPanel != null) ...[
            _ToolbarBtn(
              icon: Icons.view_sidebar_outlined,
              tooltip: '에디터 패널 토글',
              onTap: onToggleEditorPanel!,
              iconColor: style.iconColor,
              iconSize: style.iconSize,
              buttonPadding: style.buttonPadding,
              borderRadius: style.borderRadius,
            ),
            _vDivider(),
          ],
          _ToolbarBtn(
            icon: Icons.fit_screen_outlined,
            tooltip: '화면에 맞추기',
            onTap: onFit,
            iconColor: style.iconColor,
            iconSize: style.iconSize,
            buttonPadding: style.buttonPadding,
            borderRadius: style.borderRadius,
          ),
          _vDivider(),
          _ToolbarBtn(
            icon: Icons.remove,
            tooltip: '축소',
            onTap: onZoomOut,
            iconColor: style.iconColor,
            iconSize: style.iconSize,
            buttonPadding: style.buttonPadding,
            borderRadius: style.borderRadius,
          ),
          _ToolbarBtn(
            icon: Icons.add,
            tooltip: '확대',
            onTap: onZoomIn,
            iconColor: style.iconColor,
            iconSize: style.iconSize,
            buttonPadding: style.buttonPadding,
            borderRadius: style.borderRadius,
          ),
          // 사용자 정의 버튼이 있으면 구분선 + 버튼 목록 추가
          if (extraActions.isNotEmpty) ...[
            _vDivider(),
            ...extraActions.map(
              (a) => _ToolbarBtn(
                icon: a.icon,
                tooltip: a.tooltip,
                onTap: () => a.onTap(context),
                iconColor: style.iconColor,
                iconSize: style.iconSize,
                buttonPadding: style.buttonPadding,
                borderRadius: style.borderRadius,
              ),
            ),
          ],
          if (onToggleSearch != null) ...[
            _vDivider(),
            _ToolbarBtn(
              icon: Icons.search,
              tooltip: '검색',
              onTap: onToggleSearch!,
              iconColor: searchActive
                  ? const Color(0xFF0366D6)
                  : style.iconColor,
              iconSize: style.iconSize,
              buttonPadding: style.buttonPadding,
              borderRadius: style.borderRadius,
            ),
          ],
        ],
      ),
    );
  }

  Widget _vDivider() => Container(
    width: 1,
    height: style.dividerHeight,
    margin: EdgeInsets.symmetric(horizontal: style.dividerMarginHorizontal),
    color: style.dividerColor,
  );
}

class _ToolbarBtn extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final Color iconColor;
  final double iconSize;
  final double buttonPadding;
  final double borderRadius;

  const _ToolbarBtn({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    required this.iconColor,
    required this.iconSize,
    required this.buttonPadding,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(buttonPadding),
          child: Icon(icon, size: iconSize, color: iconColor),
        ),
      ),
    );
  }
}
