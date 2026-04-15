import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'hero_widget.dart';
import 'about_widget.dart';
import 'services_widget.dart';
import 'platforms_widget.dart';
import 'footer_widget.dart';
import 'background_animation_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const BackgroundAnimationWidget(),
          SingleChildScrollView(
            child: Column(
              children: const [
                HeroWidget(),
                AboutWidget(),
                ServicesWidget(),
                PlatformsWidget(),
                FooterWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
