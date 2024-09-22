import 'package:demo_rvp4/core/providers/http_provider.dart';
import 'package:demo_rvp4/features/project_list/data/datasources/project_list_remote_datasource.dart';
import 'package:demo_rvp4/features/project_list/data/datasources/project_list_remote_datasource_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final projectListDatasourceProvider = Provider<ProjectListRemoteDatasource>((ref) {
  final httpClient = ref.read(httpClientProvider);
  return ProjectListRemoteDatasourceImpl(client: httpClient);
});