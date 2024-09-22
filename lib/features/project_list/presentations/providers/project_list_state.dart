import 'package:demo_rvp4/features/project_list/domain/entities/project_dto.dart';
import 'package:equatable/equatable.dart';

class ProjectListState extends Equatable {
  final List<ProjectDto> projectList;

  const ProjectListState({required this.projectList});

  const ProjectListState.initial({
    this.projectList = const [],
  });

  ProjectListState copyWith({
    List<ProjectDto>? projectList,
  }) {
    return ProjectListState(
      projectList: projectList ?? this.projectList,
    );
  }

  ProjectListState addProjects({
    required List<ProjectDto> projects,
  }) {
    projectList.addAll(projects);
    return ProjectListState(projectList: projectList);
  }

  @override
  List<Object?> get props => [projectList];
}
