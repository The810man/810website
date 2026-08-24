import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/theme.dart';
import '../../models/platform_link.dart';
import '../../providers/content_providers.dart';
import '../../utils/responsive.dart';
import '../common/hoverable.dart';
import '../common/reveal_on_scroll.dart';
import '../common/section_header.dart';

class PlatformsSection extends ConsumerWidget {
  const PlatformsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final platforms = ref.watch(platformLinksProvider);
    final columns = context.gridColumns1to2to4;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sectionPaddingHWide,
        vertical: 96,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1152),
          child: Column(
            children: [
              const SectionHeader(comment: '// connect.sh --platforms', headline: 'Find us'),
              const SizedBox(height: 64),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: platforms.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: columns == 1 ? 2.4 : 0.95,
                ),
                itemBuilder: (context, i) => RevealOnScroll(
                  delay: Duration(milliseconds: i * 100),
                  child: _PlatformCard(platforms[i]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlatformCard extends StatelessWidget {
  const _PlatformCard(this.platform);

  final PlatformLink platform;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      onTap: () => launchUrl(Uri.parse(platform.url), webOnlyWindowName: '_blank'),
      builder: (context, hovering) => AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: hovering ? AppColors.hairlineStrong : AppColors.hairline,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('./${platform.tag}', style: AppText.comment.copyWith(fontSize: 12)),
            const SizedBox(height: 16),
            AnimatedScale(
              scale: hovering ? 1.1 : 1.0,
              duration: const Duration(milliseconds: 300),
              child: Icon(platform.icon, size: 44, color: AppColors.foreground),
            ),
            const SizedBox(height: 16),
            Text(
              platform.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.foreground),
            ),
            const SizedBox(height: 8),
            Text(platform.description, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, color: AppColors.muted)),
          ],
        ),
      ),
    );
  }
}
