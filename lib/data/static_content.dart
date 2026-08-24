import 'package:lucide_icons/lucide_icons.dart';

import '../models/platform_link.dart';
import '../models/service_item.dart';

/// Content for the Services and Platforms sections. Both read 1:1 from the
/// original TypeScript site — kept as plain consts since they don't need to
/// be user-editable the way assets/config/projects.json does.
const List<ServiceItem> kServices = [
  ServiceItem(
    id: '01',
    title: 'Game Development',
    description:
        'Indie games, VR experiences, PC and mobile titles that push creative boundaries.',
    items: ['Indie Games', 'VR Experiences', 'PC Gaming', 'Mobile Apps'],
  ),
  ServiceItem(
    id: '02',
    title: 'Software Engineering',
    description:
        'Custom scripts, automation tools, and web applications built with precision.',
    items: ['Open Source', 'Custom Scripts', 'Automation', 'Web Apps'],
  ),
  ServiceItem(
    id: '03',
    title: 'Hardware Design',
    description:
        'PCB design, circuit engineering, and embedded systems for innovative devices.',
    items: ['PCB Design', 'Circuits', 'Embedded Systems', 'Prototyping'],
  ),
  ServiceItem(
    id: '04',
    title: 'CAD & Engineering',
    description:
        '3D modeling, product design, and technical engineering for physical products.',
    items: ['3D Modeling', 'Product Design', 'Technical Drawings', 'Devices'],
  ),
];

const List<PlatformLink> kPlatformLinks = [
  PlatformLink(
    name: 'GitHub',
    icon: LucideIcons.github,
    url: 'https://github.com/810studios',
    description: 'Open source repositories',
    tag: 'dev',
  ),
  PlatformLink(
    name: 'itch.io',
    icon: LucideIcons.gamepad2,
    url: 'https://810studios.itch.io',
    description: 'Indie game releases',
    tag: 'games',
  ),
  PlatformLink(
    name: 'Steam',
    icon: LucideIcons.cloud,
    url: 'https://store.steampowered.com/search/?developer=810%20Studios',
    description: 'PC & VR games',
    tag: 'vr',
  ),
  PlatformLink(
    name: 'Play Store',
    icon: LucideIcons.smartphone,
    url: 'https://play.google.com/store/apps/dev?id=810studios',
    description: 'Mobile apps',
    tag: 'mobile',
  ),
];
