import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'typewriter_provider.freezed.dart';

@freezed
class TypewriterConfig with _$TypewriterConfig {
  const factory TypewriterConfig({
    required String text,
    @Default(Duration(milliseconds: 45)) Duration charInterval,
  }) = _TypewriterConfig;
}

/// Drives a single character-by-character reveal. Kept generic (keyed by
/// [TypewriterConfig]) so the hero terminal prompt and every section's
/// "// comment.txt" label share one implementation instead of each section
/// hand-rolling its own timer.
class TypewriterNotifier extends StateNotifier<String> {
  TypewriterNotifier(this.config) : super('') {
    _start();
  }

  final TypewriterConfig config;
  Timer? _timer;
  int _index = 0;

  void _start() {
    _timer = Timer.periodic(config.charInterval, (timer) {
      if (_index > config.text.length) {
        timer.cancel();
        return;
      }
      state = config.text.substring(0, _index);
      _index++;
    });
  }

  bool get isDone => state.length >= config.text.length;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final typewriterProvider =
    StateNotifierProvider.family<TypewriterNotifier, String, TypewriterConfig>(
  (ref, config) => TypewriterNotifier(config),
);
