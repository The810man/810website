import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/typewriter_provider.dart';

/// Renders [text] one character at a time with a blinking terminal caret —
/// the same effect the original site used for its hero `$ sudo initialize`
/// prompt, generalized so every section's `// comment.txt` label gets it.
class TypewriterText extends HookConsumerWidget {
  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.charInterval = const Duration(milliseconds: 45),
    this.showCaret = true,
  });

  final String text;
  final TextStyle? style;
  final Duration charInterval;
  final bool showCaret;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = TypewriterConfig(text: text, charInterval: charInterval);
    final displayed = ref.watch(typewriterProvider(config));
    final blink = useAnimationController(
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    return RichText(
      text: TextSpan(
        style: style,
        children: [
          TextSpan(text: displayed),
          if (showCaret)
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: FadeTransition(
                opacity: blink,
                child: Text('_', style: style),
              ),
            ),
        ],
      ),
    );
  }
}
