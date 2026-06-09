# json_graph_editor

English documentation: [README.en.md](README.en.md)

JSON을 인터랙티브 노드 그래프로 시각화하고 편집하는 Flutter 위젯.

- 좌측 패널: 라인 번호 + 문법 강조 + 블록 접기가 지원되는 JSON 에디터
- 우측 패널: 줌, 패닝, 전체 맞춤이 가능한 노드 그래프
- 노드 카드를 탭하면 속성을 인라인으로 조회·편집 가능
- `JsonEditorStyle` 로 모든 시각적 요소 커스터마이징
- 툴바에 커스텀 액션 버튼 추가 가능

---

## 설치

```yaml
dependencies:
  json_graph_editor:
    git:
      url: https://github.com/Yeo-bh/flutter_json_graph_editor.git
```

로컬 경로 사용:

```yaml
dependencies:
  json_graph_editor:
    path: ../json_graph_editor
```

---

## 기본 사용법

```dart
import 'package:json_graph_editor/json_graph_editor.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JsonEditorWidget(),
    );
  }
}
```

초기 JSON 지정:

```dart
JsonEditorWidget(
  initialJson: '{"name": "flutter", "version": "3.0"}',
)
```

---

## JSON 값 읽기

`JsonEditorWidget` 은 내부적으로 `EditorState` 를 Provider로 제공한다.
위젯 하위 어디서든 읽을 수 있다:

```dart
import 'package:provider/provider.dart';
import 'package:json_graph_editor/json_graph_editor.dart';

// JsonEditorWidget 하위 위젯 안에서
final json = context.read<EditorState>().jsonText;
```

---

## 툴바 커스텀 버튼

`extraActions` 로 그래프 툴바에 버튼을 추가한다:

```dart
JsonEditorWidget(
  extraActions: [
    GraphToolbarAction(
      icon: Icons.save_outlined,
      tooltip: '저장',
      onTap: (ctx) {
        final json = ctx.read<EditorState>().jsonText;
        // json으로 원하는 처리
      },
    ),
  ],
)
```

---

## 스타일 커스터마이징

`JsonEditorStyle` 로 모든 시각적 요소를 한번에 제어한다:

```dart
JsonEditorWidget(
  style: JsonEditorStyle(
    graphPanel: GraphPanelStyle(
      backgroundColor: const Color(0xFF1E1E2E),
    ),
    nodeCard: NodeCardStyle(
      backgroundColor: const Color(0xFF313244),
      headerBackgroundColor: const Color(0xFF45475A),
      labelColor: const Color(0xFFCDD6F4),
    ),
    edge: EdgeStyle(
      lineColor: const Color(0xFF89B4FA),
    ),
  ),
)
```

`JsonEditorStyle` 서브스타일 목록:

| 프로퍼티 | 적용 범위 |
|---|---|
| `graphPanel` | 캔버스 배경, 격자선 |
| `nodeCard` | 노드 카드 색상, 폰트, 테두리 |
| `nodeInfoDialog` | 속성 상세 다이얼로그 |
| `edge` | 연결선 색상 및 굵기 |
| `graphToolbar` | 줌/액션 툴바 |
| `editorPanel` | 코드 에디터 색상 및 폰트 |
| `splitView` | 두 패널 사이 구분선 |

`copyWith` 으로 일부만 오버라이드:

```dart
JsonEditorStyle(
  nodeCard: const NodeCardStyle().copyWith(
    borderColor: Colors.blue,
  ),
)
```

---

## 의존 패키지

- [provider](https://pub.dev/packages/provider)
- [re_editor](https://pub.dev/packages/re_editor)
- [re_highlight](https://pub.dev/packages/re_highlight)
