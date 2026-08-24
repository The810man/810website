import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../app/theme.dart';
import '../../utils/responsive.dart';
import '../common/reveal_on_scroll.dart';
import '../common/tag_chip.dart';
import '../common/typewriter_text.dart';

class HeroSection extends ConsumerWidget {
  const HeroSection({super.key});

  static const _prompt = r'$ sudo initialize 810_studios.sh';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleSize = context.isMobile ? 56.0 : (context.isTablet ? 88.0 : 128.0);

    return SizedBox(
      height: context.screenHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Align(
            alignment: Alignment(-0.5, -0.5),
            child: _PulsingOrb(reversedPhase: false),
          ),
          const Align(
            alignment: Alignment(0.5, 0.5),
            child: _PulsingOrb(reversedPhase: true),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sectionPaddingH),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const RevealOnScroll(
                  child: Opacity(
                    opacity: 0.7,
                    child: TypewriterText(text: _prompt, style: AppText.comment),
                  ),
                ),
                const SizedBox(height: 32),
                RevealOnScroll(
                  delay: const Duration(milliseconds: 300),
                  child: Text(
                    '810 Studios',
                    textAlign: TextAlign.center,
                    style: AppText.headline.copyWith(fontSize: titleSize),
                  ),
                ),
                const SizedBox(height: 20),
                RevealOnScroll(
                  delay: const Duration(milliseconds: 500),
                  child: Text(
                    'Creating experiences that matter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: context.isMobile ? 20 : 28,
                      color: AppColors.muted,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                const RevealOnScroll(
                  delay: Duration(milliseconds: 700),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      TagChip('Games'),
                      TagChip('VR'),
                      TagChip('Hardware'),
                      TagChip('Open Source'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(bottom: 32, child: _ChevronBounce()),
        ],
      ),
    );
  }
}

class _PulsingOrb extends HookWidget {
  const _PulsingOrb({required this.reversedPhase});

  final bool reversedPhase;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 8))
      ..repeat(reverse: true);
    final scale = useAnimation(Tween<double>(
      begin: reversedPhase ? 1.2 : 1.0,
      end: reversedPhase ? 1.0 : 1.2,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut)));
    final opacity = useAnimation(Tween<double>(
      begin: reversedPhase ? 0.5 : 0.3,
      end: reversedPhase ? 0.3 : 0.5,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut)));

    return Transform.scale(
      scale: scale,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 64, sigmaY: 64),
        child: Container(
          width: 384,
          height: 384,
          decoration: BoxDecoration(
            color: AppColors.foreground.withValues(alpha: opacity * 0.05),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _ChevronBounce extends HookWidget {
  const _ChevronBounce();

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
    final offset = useAnimation(Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    ));

    return Transform.translate(
      offset: Offset(0, offset),
      child: const Icon(LucideIcons.chevronDown, size: 32, color: AppColors.dim),
    );
  }
}
