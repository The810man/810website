import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/theme.dart';
import '../../models/project.dart';
import '../common/hoverable.dart';
import '../common/tag_chip.dart';
import 'frame/ascii_frame.dart';

/// Every category uses the same ASCII blueprint frame — a crosshair
/// titlebar and box-drawing corner glyphs — wrapping the shared
/// [_CardBody] content.
class ProjectCard extends StatelessWidget {
  const ProjectCard(this.project, {super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final accent = project.category.accent;
    return HoverBuilder(
      onTap: project.repoUrl == null
          ? null
          : () => launchUrl(Uri.parse(project.repoUrl!), webOnlyWindowName: '_blank'),
      builder: (context, hovering) {
        return AsciiFrame(
          title: '[${project.category.slug}] ${_slugify(project.title)}.dwg',
          accent: accent,
          hovering: hovering,
          child: _CardBody(project: project, accent: accent),
        );
      },
    );
  }

  String _slugify(String title) => title.toLowerCase().replaceAll(' ', '_');
}

class _CardBody extends StatelessWidget {
  const _CardBody({required this.project, required this.accent});

  final Project project;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // A faint per-category brand mark, tinted to the category accent —
        // reuses the same 810 mark exported in every accent color under
        // assets/images/branding/, so each category reads as "its own".
        Positioned.fill(
          child: IgnorePointer(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Opacity(
                opacity: 0.05,
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: SvgPicture.asset(project.category.markAsset, fit: BoxFit.contain),
                ),
              ),
            ),
          ),
        ),
        _content(),
      ],
    );
  }

  Widget _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (project.imageAsset != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 16 / 10,
              child: Image.asset(project.imageAsset!, fit: BoxFit.cover, cacheWidth: 640),
            ),
          ),
        if (project.imageAsset != null) const SizedBox(height: 14),
        Row(
          children: [
            Icon(project.category.icon, size: 15, color: accent),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                project.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.foreground),
              ),
            ),
            if (project.year != null)
              Text('${project.year}', style: AppText.comment.copyWith(fontSize: 11)),
          ],
        ),
        const SizedBox(height: 10),
        Text(project.description, style: const TextStyle(fontSize: 13.5, height: 1.5, color: AppColors.dim)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [for (final tag in project.tags) TagChip(tag, filled: false, dense: true)],
        ),
        if (project.repoUrl != null) ...[
          const SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(LucideIcons.externalLink, size: 12, color: accent),
              const SizedBox(width: 6),
              Text('view repo', style: TextStyle(fontFamily: AppFonts.mono, fontSize: 12, color: accent)),
            ],
          ),
        ],
      ],
    );
  }
}

