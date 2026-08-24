import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../../utils/responsive.dart';
import '../common/reveal_on_scroll.dart';
import '../common/section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const _mission =
      '810 Studios is an independent collective pushing the boundaries of '
      'interactive experiences. From immersive VR worlds to innovative '
      'mobile games, we craft experiences that captivate and inspire.';

  static const _vision =
      'Beyond software, we engineer custom hardware solutions, design PCBs, '
      'and develop open-source tools for the community. Everything we '
      'create is driven by innovation and shared with the world.';

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: context.screenHeight),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sectionPaddingH,
          vertical: 96,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1152),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SectionHeader(
                  comment: '// About us',
                  headline: 'We build the\nfuture',
                  center: false,
                ),
                const SizedBox(height: 48),
                if (context.isDesktop)
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _Column(label: '// mission.txt', body: _mission, delayMs: 200)),
                      SizedBox(width: 48),
                      Expanded(child: _Column(label: '// vision.txt', body: _vision, delayMs: 400)),
                    ],
                  )
                else
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Column(label: '// mission.txt', body: _mission, delayMs: 200),
                      SizedBox(height: 32),
                      _Column(label: '// vision.txt', body: _vision, delayMs: 400),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Column extends StatelessWidget {
  const _Column({required this.label, required this.body, required this.delayMs});

  final String label;
  final String body;
  final int delayMs;

  @override
  Widget build(BuildContext context) {
    return RevealOnScroll(
      delay: Duration(milliseconds: delayMs),
      slideOffset: const Offset(0.06, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppText.comment.copyWith(fontSize: 12)),
          const SizedBox(height: 12),
          Text(body, style: AppText.body),
        ],
      ),
    );
  }
}
