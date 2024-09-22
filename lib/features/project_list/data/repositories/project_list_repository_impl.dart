import 'package:dartz/dartz.dart';
import 'package:demo_rvp4/core/error/exception.dart';
import 'package:demo_rvp4/core/error/failure.dart';
import 'package:demo_rvp4/core/platform/network_info.dart';
import 'package:demo_rvp4/features/project_list/data/datasources/project_list_remote_datasource.dart';
import 'package:demo_rvp4/features/project_list/domain/entities/project_dto.dart';
import 'package:demo_rvp4/features/project_list/domain/respositories/project_list_repository.dart';

class ProjectListRepositoryImpl implements ProjectListRepository {
  final NetworkInfo networkInfo;
  final ProjectListRemoteDatasource remoteDataSource;

  const ProjectListRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ProjectDto>>> getProjectList(
      int limit, int offset) async {
    bool isOnline = await networkInfo.isConnected;
    if (isOnline) {
      try {
        final remotePopularProjects =
            await remoteDataSource.getProjectList(limit, offset);
        return Right(remotePopularProjects);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
