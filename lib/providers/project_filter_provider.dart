import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/project.dart';

part 'project_filter_provider.freezed.dart';

@freezed
class ProjectFilterState with _$ProjectFilterState {
  const factory ProjectFilterState({
    ProjectCategory? selected,
  }) = _ProjectFilterState;
}

class ProjectFilterNotifier extends StateNotifier<ProjectFilterState> {
  ProjectFilterNotifier() : super(const ProjectFilterState());

  void select(ProjectCategory? category) {
    state = ProjectFilterState(
      selected: state.selected == category ? null : category,
    );
  }
}

final projectFilterProvider =
    StateNotifierProvider<ProjectFilterNotifier, ProjectFilterState>(
  (ref) => ProjectFilterNotifier(),
);
