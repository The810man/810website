import 'package:flutter/material.dart';

import '../../app/theme.dart';
import 'hoverable.dart';

/// The pill-shaped tag used throughout the site: hero badges, service tags,
/// project tags. Brightens its border on hover, matching the original's
/// `hover:border-white/40` micro-interaction.
class TagChip extends StatelessWidget {
  const TagChip(
    this.label, {
    super.key,
    this.filled = true,
    this.dense = false,
  });

  final String label;
  final bool filled;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: (context, hovering) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: dense ? 12 : 16,
          vertical: dense ? 6 : 8,
        ),
        decoration: BoxDecoration(
          color: filled ? AppColors.surface : Colors.transparent,
          border: Border.all(
            color: hovering ? AppColors.hairlineStrong : AppColors.hairline,
          ),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: AppText.tag.copyWith(
            color: hovering ? AppColors.dim : AppColors.muted,
          ),
        ),
      ),
    );
  }
}
