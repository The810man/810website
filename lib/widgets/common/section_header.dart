import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../../utils/responsive.dart';
import 'reveal_on_scroll.dart';
import 'typewriter_text.dart';

/// The `// comment.txt` label + big headline pattern repeated at the top of
/// every section in the original site (About, Services, Platforms, and now
/// Projects).
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.comment,
    required this.headline,
    this.center = true,
  });

  final String comment;
  final String headline;
  final bool center;

  @override
  Widget build(BuildContext context) {
    final size = context.isMobile ? 40.0 : (context.isTablet ? 56.0 : 72.0);
    return RevealOnScroll(
      child: Column(
        crossAxisAlignment:
            center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          TypewriterText(text: comment, style: AppText.comment),
          const SizedBox(height: 16),
          Text(
            headline,
            textAlign: center ? TextAlign.center : TextAlign.start,
            style: AppText.headline.copyWith(fontSize: size),
          ),
        ],
      ),
    );
  }
}
