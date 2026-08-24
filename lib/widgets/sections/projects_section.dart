import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app/theme.dart';
import '../../models/project.dart';
import '../../providers/project_filter_provider.dart';
import '../../providers/projects_provider.dart';
import '../../utils/responsive.dart';
import '../common/hoverable.dart';
import '../common/reveal_on_scroll.dart';
import '../common/section_header.dart';
import '../project_card/project_card.dart';

/// The open-source project feed: filterable by the same four categories the
/// Services section advertises, sourced from assets/config/projects.json so
/// new entries never require a code change.
class ProjectsSection extends ConsumerWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(projectsProvider);
    final filter = ref.watch(projectFilterProvider);
    final columns = context.gridColumns1to2to4;

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
              const SectionHeader(comment: '// projects.feed()', headline: 'What we ship'),
              const SizedBox(height: 40),
              const _CategoryTabs(),
              const SizedBox(height: 48),
              projectsAsync.when(
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 48),
                  child: CircularProgressIndicator(color: AppColors.faint, strokeWidth: 1.5),
                ),
                error: (e, st) => const Text('// failed to load projects.json', style: AppText.comment),
                data: (projects) {
                  final visible = filter.selected == null
                      ? projects
                      : projects.where((p) => p.category == filter.selected).toList();
                  if (visible.isEmpty) return const _EmptyFeed();
                  // A fixed-aspect-ratio grid forces every card to the same
                  // cell height, clipping whichever one has more text/tags
                  // than the row's shortest — a Wrap lets each card size to
                  // its own content instead, so nothing ever overflows.
                  const spacing = 28.0;
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      final cardWidth = (constraints.maxWidth - spacing * (columns - 1)) / columns;
                      return Wrap(
                        spacing: spacing,
                        runSpacing: spacing,
                        children: [
                          for (var i = 0; i < visible.length; i++)
                            SizedBox(
                              width: cardWidth,
                              child: RevealOnScroll(
                                delay: Duration(milliseconds: i * 80),
                                child: ProjectCard(visible[i]),
                              ),
                            ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryTabs extends ConsumerWidget {
  const _CategoryTabs();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(projectFilterProvider).selected;
    final notifier = ref.read(projectFilterProvider.notifier);

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final category in ProjectCategory.values)
          HoverBuilder(
            onTap: () => notifier.select(category),
            builder: (context, hovering) {
              final active = selected == category;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                decoration: BoxDecoration(
                  color: active ? category.accent.withValues(alpha: 0.12) : Colors.transparent,
                  border: Border.all(
                    color: active
                        ? category.accent.withValues(alpha: 0.7)
                        : (hovering ? AppColors.hairlineStrong : AppColors.hairline),
                  ),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(category.icon, size: 14, color: active ? category.accent : AppColors.muted),
                    const SizedBox(width: 8),
                    Text(
                      category.label,
                      style: TextStyle(
                        fontFamily: AppFonts.mono,
                        fontSize: 13,
                        color: active ? AppColors.foreground : AppColors.muted,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
      ],
    );
  }
}

class _EmptyFeed extends StatelessWidget {
  const _EmptyFeed();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 56),
      child: Text('// no entries in this category yet', style: AppText.comment),
    );
  }
}
