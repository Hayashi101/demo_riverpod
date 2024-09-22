import 'package:demo_rvp4/core/providers/network_info_provider.dart';
import 'package:demo_rvp4/features/project_list/data/datasources/project_list_datasource_provider.dart';
import 'package:demo_rvp4/features/project_list/data/repositories/project_list_repository_impl.dart';
import 'package:demo_rvp4/features/project_list/domain/respositories/project_list_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final projectListRepositoryProvider = Provider<ProjectListRepository>((ref) {
  final datasource = ref.read(projectListDatasourceProvider);
  final networkInfo = ref.read(networkInfoProvider);

  return ProjectListRepositoryImpl(
      remoteDataSource: datasource, networkInfo: networkInfo);
});
