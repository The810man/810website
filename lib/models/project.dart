import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lucide_icons/lucide_icons.dart';

part 'project.freezed.dart';

/// The four pillars 810 Studios works in — mirrors [ServiceItem] on purpose
/// so the project feed can be filtered by the same categories the Services
/// section advertises.
enum ProjectCategory { games, apps, hardware, cad }

extension ProjectCategoryX on ProjectCategory {
  String get label => switch (this) {
        ProjectCategory.games => 'Games',
        ProjectCategory.apps => 'Apps',
        ProjectCategory.hardware => 'Hardware',
        ProjectCategory.cad => 'CAD',
      };

  String get slug => name;

  IconData get icon => switch (this) {
        ProjectCategory.games => LucideIcons.gamepad2,
        ProjectCategory.apps => LucideIcons.terminal,
        ProjectCategory.hardware => LucideIcons.cpu,
        ProjectCategory.cad => LucideIcons.boxes,
      };

  /// Pulled straight from the 810 mark color variants in
  /// assets/images/branding — keeps every category tied to a real brand
  /// asset instead of an arbitrary Material color.
  Color get accent => switch (this) {
        ProjectCategory.games => const Color(0xFF75C3D1), // sky blue
        ProjectCategory.apps => const Color(0xFFD9FFD2), // tea green
        ProjectCategory.hardware => const Color(0xFFA33E43), // dusty mauve
        ProjectCategory.cad => const Color(0xFFFBF2DA), // vanilla cream
      };

  String get markAsset =>
      'assets/images/branding/810_mark_${_markName(this)}.svg';

  static String _markName(ProjectCategory c) => switch (c) {
        ProjectCategory.games => 'sky_blue',
        ProjectCategory.apps => 'tea_green',
        ProjectCategory.hardware => 'dusty_mauve',
        ProjectCategory.cad => 'vanilla_cream',
      };
}

@freezed
class Project with _$Project {
  const Project._();

  const factory Project({
    required String id,
    required String title,
    required ProjectCategory category,
    required String description,
    required List<String> tags,
    String? repoUrl,
    String? imageAsset,
    int? year,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String,
      title: json['title'] as String,
      category: ProjectCategory.values.byName(json['category'] as String),
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).cast<String>(),
      repoUrl: json['repoUrl'] as String?,
      imageAsset: json['imageAsset'] as String?,
      year: json['year'] as int?,
    );
  }
}
