import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PlatformItem {
  final String name;
  final IconData icon;
  final String url;
  final String description;
  final String tag;

  const PlatformItem(
      {required this.name,
      required this.icon,
      required this.url,
      required this.description,
      required this.tag});
}

const List<PlatformItem> platforms = [
  PlatformItem(
      name: 'GitHub',
      icon: LucideIcons.github,
      url: 'https://github.com/810studios',
      description: 'Open source repositories',
      tag: 'dev'),
  PlatformItem(
      name: 'itch.io',
      icon: LucideIcons.gamepad2,
      url: 'https://810studios.itch.io',
      description: 'Indie game releases',
      tag: 'games'),
  PlatformItem(
      name: 'Steam',
      icon: LucideIcons.cloud,
      url: 'https://store.steampowered.com/search/?developer=810%20Studios',
      description: 'PC & VR games',
      tag: 'vr'),
  PlatformItem(
      name: 'Play Store',
      icon: LucideIcons.smartphone,
      url: 'https://play.google.com/store/apps/dev?id=810studios',
      description: 'Mobile apps',
      tag: 'mobile'),
];

class PlatformsWidget extends StatelessWidget {
  const PlatformsWidget({Key? key}) : super(key: key);

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int crossAxisCount = 1;
    if (width >= 1024) {
      crossAxisCount = 4;
    } else if (width >= 640) {
      crossAxisCount = 2;
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '// connect.sh --platforms',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Find us',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 48),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 32,
                crossAxisSpacing: 32,
                childAspectRatio: 1.3,
              ),
              itemCount: platforms.length,
              itemBuilder: (context, index) {
                final platform = platforms[index];
                return InkWell(
                  onTap: () => _launchURL(platform.url),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white.withOpacity(0.15)),
                    ),
                    child: Row(
                      children: [
                        Icon(platform.icon, size: 40, color: Colors.white70),
                        const SizedBox(width: 24),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                platform.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                platform.description,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
