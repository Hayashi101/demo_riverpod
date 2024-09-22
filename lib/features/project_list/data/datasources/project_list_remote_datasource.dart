import 'package:demo_rvp4/features/project_list/data/models/project_model.dart';

abstract class ProjectListRemoteDatasource {
  Future<List<ProjectModel>> getProjectList(int limit, int offset);
} 