import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'split_view_style.freezed.dart';

@freezed
abstract class SplitViewStyle with _$SplitViewStyle {
  const factory SplitViewStyle({
    /// 분할선 색.
    @Default(Color(0xFFE1E4E8)) Color dividerColor,

    /// 분할선 너비(px). 드래그 히트 영역 역할도 함.
    @Default(8.0) double dividerWidth,

    /// 좌측 패널 최소 비율 (전체 너비 대비, 0.0~1.0).
    @Default(0.2) double minRatio,

    /// 좌측 패널 최대 비율 (전체 너비 대비, 0.0~1.0).
    @Default(0.7) double maxRatio,
  }) = _SplitViewStyle;
}
