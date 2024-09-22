import 'package:demo_rvp4/features/project_list/domain/entities/project_dto.dart';
import 'package:demo_rvp4/features/project_list/domain/respositories/project_list_repository_provider.dart';
import 'package:demo_rvp4/features/project_list/domain/usecases/get_project_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProjectListProvider = Provider<GetProjectListUsecase>((ref) {
  final repository = ref.read(projectListRepositoryProvider);
  return GetProjectListUsecase(repository);
});

class ProjectListNotifier extends StateNotifier<List<ProjectDto>> {
  final GetProjectListUsecase _getProjectListUsecase;

  ProjectListNotifier(this._getProjectListUsecase) : super([]);

  Future getProjectList(int limit, int offset) async {
    debugPrint('limit => $limit, offset => $offset');
    final getProjectListOrFailure = await _getProjectListUsecase(
        GetProjectListParams(limit: limit, offset: offset));
    getProjectListOrFailure.fold((l) => state = [], (r) {
      if (r.length >= limit) return state.addAll(r);
    });
  }
}

final projectListNotifierProvider = StateNotifierProvider<ProjectListNotifier, List<ProjectDto>>((ref) {
  final getProjectList = ref.read(getProjectListProvider);

  return ProjectListNotifier(getProjectList);
});
