import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/static_content.dart';
import '../models/platform_link.dart';
import '../models/service_item.dart';

final servicesProvider = Provider<List<ServiceItem>>((ref) => kServices);

final platformLinksProvider =
    Provider<List<PlatformLink>>((ref) => kPlatformLinks);

/// The page's single scroll controller, provided by [HomePage] so any
/// descendant (e.g. RevealOnScroll) can listen for scroll-into-view without
/// threading the controller through every widget's constructor.
final scrollControllerProvider = Provider<ScrollController>((ref) {
  throw UnimplementedError('scrollControllerProvider must be overridden');
});
