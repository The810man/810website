import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app/theme.dart';
import '../../models/service_item.dart';
import '../../providers/content_providers.dart';
import '../../utils/responsive.dart';
import '../common/hoverable.dart';
import '../common/reveal_on_scroll.dart';
import '../common/section_header.dart';
import '../common/tag_chip.dart';

class ServicesSection extends ConsumerWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(servicesProvider);
    final columns = context.gridColumns1to2;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sectionPaddingH,
        vertical: 96,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            children: [
              const SectionHeader(comment: '// services.init()', headline: 'What we do'),
              const SizedBox(height: 64),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: services.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: columns == 1 ? 1.05 : 1.35,
                ),
                itemBuilder: (context, i) => RevealOnScroll(
                  delay: Duration(milliseconds: i * 100),
                  child: _ServiceCard(services[i]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard(this.service);

  final ServiceItem service;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: (context, hovering) => AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: hovering ? AppColors.hairlineStrong : AppColors.hairline,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    service.title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: AppColors.foreground,
                    ),
                  ),
                ),
                Text(service.id, style: AppText.comment.copyWith(fontSize: 13)),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(child: Text(service.description, style: AppText.body)),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [for (final item in service.items) TagChip(item, filled: false, dense: true)],
            ),
          ],
        ),
      ),
    );
  }
}
