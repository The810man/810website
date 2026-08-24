import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app/theme.dart';
import '../providers/content_providers.dart';
import '../widgets/background/background_animation_widget.dart';
import '../widgets/sections/about_section.dart';
import '../widgets/sections/footer_section.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/platforms_section.dart';
import '../widgets/sections/projects_section.dart';
import '../widgets/sections/services_section.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    return ProviderScope(
      overrides: [scrollControllerProvider.overrideWithValue(scrollController)],
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            const BackgroundAnimationWidget(),
            SingleChildScrollView(
              controller: scrollController,
              child: const Column(
                children: [
                  HeroSection(),
                  AboutSection(),
                  ServicesSection(),
                  ProjectsSection(),
                  PlatformsSection(),
                  FooterSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
