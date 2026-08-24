import 'package:flutter/material.dart';

/// Core palette. The site is black/white/gray — accent colors are reserved
/// for project category framing and are defined in [CategoryAccent].
abstract final class AppColors {
  static const background = Colors.black;
  static const foreground = Colors.white;
  static const dim = Color(0xB3FFFFFF); // white70-ish, matches Tailwind gray-300/400 feel
  static const muted = Color(0x99FFFFFF); // gray-400
  static const faint = Color(0x66FFFFFF); // gray-500/600 comment color
  static const hairline = Color(0x1AFFFFFF); // border-white/10
  static const hairlineStrong = Color(0x4DFFFFFF); // border-white/30 hover
  static const surface = Color(0x0FFFFFFF); // bg-white/5-6
  static const surfaceStrong = Color(0x26FFFFFF);
}

abstract final class AppFonts {
  static const mono = 'monospace';
}

abstract final class AppText {
  static const comment = TextStyle(
    fontFamily: AppFonts.mono,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.faint,
    letterSpacing: 0.2,
  );

  static const headline = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.foreground,
    height: 1.05,
    letterSpacing: -1,
  );

  static const body = TextStyle(
    fontSize: 16,
    color: AppColors.dim,
    height: 1.6,
  );

  static const tag = TextStyle(
    fontFamily: AppFonts.mono,
    fontSize: 12,
    color: AppColors.muted,
  );
}

/// Breakpoints mirror the Tailwind config the original site used.
abstract final class AppBreakpoints {
  static const sm = 640.0;
  static const md = 768.0;
  static const lg = 1024.0;
}

abstract final class AppSpacing {
  static const sectionPaddingH = 24.0;
  static const sectionPaddingHWide = 32.0;
  static const sectionGapV = 96.0;
}
