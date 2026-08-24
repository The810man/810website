import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'platform_link.freezed.dart';

@freezed
class PlatformLink with _$PlatformLink {
  const factory PlatformLink({
    required String name,
    required IconData icon,
    required String url,
    required String description,
    required String tag,
  }) = _PlatformLink;
}
