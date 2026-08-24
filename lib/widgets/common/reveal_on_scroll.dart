import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/content_providers.dart';

/// Fades + slides [child] in once it scrolls within view — a from-scratch
/// stand-in for framer-motion's `whileInView`/`viewport:{once:true}`, built
/// on the page's shared [scrollControllerProvider] instead of a platform
/// visibility-observer package.
class RevealOnScroll extends HookConsumerWidget {
  const RevealOnScroll({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.slideOffset = const Offset(0, 0.08),
  });

  final Widget child;
  final Duration delay;
  final Offset slideOffset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final revealed = useState(false);
    final triggered = useRef(false);
    final itemKey = useMemoized(() => GlobalKey());
    final controller = ref.watch(scrollControllerProvider);

    void check() {
      if (triggered.value) return;
      final renderObject = itemKey.currentContext?.findRenderObject();
      if (renderObject is! RenderBox || !renderObject.attached) return;
      final top = renderObject.localToGlobal(Offset.zero).dy;
      final viewportHeight = MediaQuery.sizeOf(context).height;
      // Content shorter than the page's final scroll position (e.g. the
      // footer) can land with its top already past a fractional threshold
      // once maxScrollExtent is hit, with no further scroll events left to
      // re-check it — so any part of the top edge entering the viewport at
      // all is enough to trigger the reveal.
      if (top < viewportHeight) {
        triggered.value = true;
        Future.delayed(delay, () {
          if (context.mounted) revealed.value = true;
        });
      }
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) => check());
      controller.addListener(check);
      return () => controller.removeListener(check);
    }, [controller]);

    return KeyedSubtree(
      key: itemKey,
      child: AnimatedSlide(
        offset: revealed.value ? Offset.zero : slideOffset,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutCubic,
        child: AnimatedOpacity(
          opacity: revealed.value ? 1 : 0,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutCubic,
          child: child,
        ),
      ),
    );
  }
}
