import 'package:flutter/widgets.dart';

import '../app/theme.dart';

/// Small breakpoint helpers mirroring the Tailwind sm/md/lg cutoffs the
/// original site used for its grid layouts.
extension Responsive on BuildContext {
  double get _width => MediaQuery.sizeOf(this).width;

  bool get isMobile => _width < AppBreakpoints.md;
  bool get isTablet =>
      _width >= AppBreakpoints.md && _width < AppBreakpoints.lg;
  bool get isDesktop => _width >= AppBreakpoints.lg;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  /// Grid columns for cards that go 1 -> 2 -> 4 across sm/lg, as used by
  /// the Platforms and Projects sections.
  int get gridColumns1to2to4 {
    if (_width >= AppBreakpoints.lg) return 4;
    if (_width >= AppBreakpoints.sm) return 2;
    return 1;
  }

  /// Grid columns for cards that go 1 -> 2 across md, as used by Services.
  int get gridColumns1to2 => _width >= AppBreakpoints.md ? 2 : 1;
}
