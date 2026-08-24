import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/project.dart';

/// Reads the open-source project feed from assets/config/projects.json.
///
/// To publish a new project on the homepage, add an object to the
/// `projects` array in that file — no Dart changes needed. Schema:
/// `id`, `title`, `category` (games|apps|hardware|cad), `description`,
/// `tags`; optional `repoUrl`, `imageAsset`, `year`.
class ProjectsRepository {
  const ProjectsRepository();

  static const _assetPath = 'assets/config/projects.json';

  Future<List<Project>> loadProjects() async {
    final raw = await rootBundle.loadString(_assetPath);
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    final list = decoded['projects'] as List<dynamic>;
    return list
        .map((e) => Project.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }
}
