import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/projects_repository.dart';
import '../models/project.dart';

final projectsRepositoryProvider =
    Provider<ProjectsRepository>((ref) => const ProjectsRepository());

/// Riverpod's [AsyncValue] already models loading/data/error, so the feed
/// doesn't need a hand-rolled freezed union on top of it — this is the
/// idiomatic "notifier" for a one-shot async load.
final projectsProvider = FutureProvider<List<Project>>((ref) {
  return ref.watch(projectsRepositoryProvider).loadProjects();
});
