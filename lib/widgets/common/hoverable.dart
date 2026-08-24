import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Tracks hover state and hands it to [builder] — the shared primitive
/// behind every "border brightens / scales up on hover" interaction the
/// original site used (service cards, platform cards, hero tag pills).
class HoverBuilder extends HookWidget {
  const HoverBuilder({
    super.key,
    required this.builder,
    this.onTap,
  });

  final Widget Function(BuildContext context, bool hovering) builder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final hovering = useState(false);
    return MouseRegion(
      cursor: onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) => hovering.value = true,
      onExit: (_) => hovering.value = false,
      child: GestureDetector(
        onTap: onTap,
        child: builder(context, hovering.value),
      ),
    );
  }
}
