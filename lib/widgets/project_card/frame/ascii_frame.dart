import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../app/theme.dart';

/// A box-drawn "window" frame with a crosshair/annotation titlebar and
/// monospace corner glyphs poking past the card edge — a technical-sheet
/// feel used uniformly across every project category.
class AsciiFrame extends StatelessWidget {
  const AsciiFrame({
    super.key,
    required this.title,
    required this.accent,
    required this.hovering,
    required this.child,
  });

  final String title;
  final Color accent;
  final bool hovering;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: hovering ? accent.withValues(alpha: 0.6) : AppColors.hairline,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(title: title, accent: accent),
              Padding(padding: const EdgeInsets.fromLTRB(18, 14, 18, 18), child: child),
            ],
          ),
        ),
        for (final corner in _CornerGlyph.values) corner.build(accent),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.title, required this.accent});

  final String title;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.hairline)),
      ),
      child: Row(
        children: [
          Icon(LucideIcons.crosshair, size: 13, color: accent.withValues(alpha: 0.85)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontFamily: AppFonts.mono, fontSize: 12, color: AppColors.faint),
            ),
          ),
        ],
      ),
    );
  }
}

enum _CornerGlyph {
  topLeft('┌', -8, null, -6, null),
  topRight('┐', -8, null, null, -6),
  bottomLeft('└', null, -10, -6, null),
  bottomRight('┘', null, -10, null, -6);

  const _CornerGlyph(this.glyph, this.top, this.bottom, this.left, this.right);

  final String glyph;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  Widget build(Color accent) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Text(
        glyph,
        style: TextStyle(
          fontFamily: AppFonts.mono,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: accent.withValues(alpha: 0.75),
        ),
      ),
    );
  }
}
