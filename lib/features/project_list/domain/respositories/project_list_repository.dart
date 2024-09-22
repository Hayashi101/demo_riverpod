import 'package:dartz/dartz.dart';
import 'package:demo_rvp4/core/error/failure.dart';
import 'package:demo_rvp4/features/project_list/domain/entities/project_dto.dart';

abstract class ProjectListRepository {
  Future<Either<Failure, List<ProjectDto>>> getProjectList(int limit, int offset);
}