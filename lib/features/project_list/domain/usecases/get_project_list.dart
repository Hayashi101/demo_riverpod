import 'package:dartz/dartz.dart';
import 'package:demo_rvp4/core/error/failure.dart';
import 'package:demo_rvp4/core/usecases/usecase.dart';
import 'package:demo_rvp4/features/project_list/domain/entities/project_dto.dart';
import 'package:demo_rvp4/features/project_list/domain/respositories/project_list_repository.dart';

class GetProjectListUsecase extends UseCase<List<ProjectDto>, GetProjectListParams> {
  final ProjectListRepository _repo;

  GetProjectListUsecase(this._repo);

  @override
  Future<Either<Failure, List<ProjectDto>>> call(GetProjectListParams params) {
    return _repo.getProjectList(params.limit, params.offset);
  }
}


class GetProjectListParams {
  final int limit;
  final int offset;

  const GetProjectListParams({required this.limit, required this.offset});
}