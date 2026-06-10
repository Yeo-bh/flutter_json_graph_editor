import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edge_style.freezed.dart';

@freezed
abstract class EdgeStyle with _$EdgeStyle {
  const factory EdgeStyle({
    /// 연결선 색상.
    @Default(Color(0xFFD1D5DB)) Color lineColor,

    /// 연결선 두께(px).
    @Default(1.5) double lineWidth,
  }) = _EdgeStyle;
}
