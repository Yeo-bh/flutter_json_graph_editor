# json_graph_editor

English documentation: [README.en.md](README.en.md)

JSON을 인터랙티브 노드 그래프로 시각화하고 편집하는 Flutter 위젯.

![preview](assets/screenshots/example.png)

- 좌측 패널: 라인 번호 + 문법 강조 + 블록 접기가 지원되는 JSON 에디터
- 우측 패널: 줌, 패닝, 전체 맞춤이 가능한 노드 그래프
- 노드 카드를 탭하면 속성을 사이드 패널에서 조회·편집·추가·삭제 가능
- 툴바 검색으로 노드 이름 / entry 키 / 값 검색 — 매칭 노드 자동 펼치기 + 강조
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

## 변경 콜백 (onChanged)

버튼 없이 JSON이 수정될 때마다 자동으로 값을 받으려면 `onChanged`를 사용한다.

### JsonEditorWidget

```dart
JsonEditorWidget(
  initialJson: '{"name": "flutter"}',
  onChanged: (dynamic json) {
    // json은 Map<String, dynamic> 또는 List<dynamic>
    print(json);
  },
)
```

JSON이 유효할 때만 호출된다. 텍스트 에디터 수정과 그래프 노드 수정 모두 트리거한다.

### JsonEditorTabView

`JsonEditorTabController`의 `onChanged`로 모든 탭의 변경을 수신한다:

```dart
final controller = JsonEditorTabController(
  initialTabs: [
    (name: 'user.json', initialJson: '{"id": 1}'),
    (name: 'config.json', initialJson: '{"debug": true}'),
  ],
  onChanged: (String tabId, dynamic json) {
    print('탭 $tabId 변경: $json');
  },
);
```

생성 후 세팅도 가능하다:

```dart
controller.onChanged = (tabId, json) { ... };
```

탭 추가/제거 시 listener가 자동으로 등록·해제된다.

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

## 검색

툴바 우측 🔍 버튼으로 검색 바를 열고 Enter 또는 검색 버튼으로 실행한다.

| 모드 | 검색 대상 |
|------|----------|
| 전체 (기본) | 노드 label + entry 키 + entry 값 |
| 키 | 노드 label만 |
| Value | entry 값만 |

- 매칭된 노드는 주황 테두리, 매칭된 entry 행은 노란 배경으로 강조
- 매칭 노드까지의 경로(조상)도 함께 강조
- 검색 시 해당 경로 자동 펼치기

---

## 의존 패키지

- [provider](https://pub.dev/packages/provider)
- [re_editor](https://pub.dev/packages/re_editor)
- [re_highlight](https://pub.dev/packages/re_highlight)
