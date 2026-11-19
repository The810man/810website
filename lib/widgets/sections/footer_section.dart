import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/link.dart';

import '../../app/theme.dart';
import '../../utils/responsive.dart';
import '../common/reveal_on_scroll.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/images/branding/810_mark.svg', width: 22, height: 22),
            const SizedBox(width: 12),
            const Text('© 2026 810 Studios', style: AppText.comment),
          ],
        ),
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          children: [
            Text('//', style: AppText.comment),
            Text('Open Source', style: TextStyle(color: AppColors.muted, fontSize: 14)),
            Text('•', style: TextStyle(color: AppColors.hairlineStrong, fontSize: 14)),
            Text('Independent', style: TextStyle(color: AppColors.muted, fontSize: 14)),
            Text('•', style: TextStyle(color: AppColors.hairlineStrong, fontSize: 14)),
            Text('Innovative', style: TextStyle(color: AppColors.muted, fontSize: 14)),
          ],
        ),
      ],
    );

    return RevealOnScroll(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sectionPaddingH,
          vertical: 48,
        ),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.hairline)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (context.isMobile) ...[
              row.children[0],
              const SizedBox(height: 16),
              row.children[1],
            ] else
              row,
            const SizedBox(height: 24),
            const _FontCredit(),
          ],
        ),
      ),
    );
  }
}

/// Required by the Fontfabric Free Font EULA for the Archive headline font:
/// web use is only allowed with a link to fontfabric.com on the site.
class _FontCredit extends StatelessWidget {
  const _FontCredit();

  @override
  Widget build(BuildContext context) {
    final style = AppText.comment.copyWith(fontSize: 12);
    return Link(
      uri: Uri.parse('https://www.fontfabric.com/'),
      target: LinkTarget.blank,
      builder: (context, followLink) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: followLink,
          child: Text.rich(
            TextSpan(
              style: style,
              children: [
                const TextSpan(text: '// headline font: Archive by '),
                TextSpan(
                  text: 'Fontfabric',
                  style: style.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.faint,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
