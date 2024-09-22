import 'dart:convert';

import 'package:demo_rvp4/config/network/api_domain.dart';
import 'package:demo_rvp4/core/error/exception.dart';
import 'package:http/http.dart' as http;
import 'package:demo_rvp4/features/project_list/data/datasources/project_list_remote_datasource.dart';
import 'package:demo_rvp4/features/project_list/data/models/project_model.dart';

class ProjectListRemoteDatasourceImpl extends ProjectListRemoteDatasource {
  final http.Client client;
  ProjectListRemoteDatasourceImpl({required this.client});

  @override
  Future<List<ProjectModel>> getProjectList(int limit, int offset) async {
    final response = await client.get(
        Uri.parse(
            '$stagingDomainPropertyApi/property/project/popular?limit=$limit&offset=$offset'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return ProjectModel.fromJsonList(
          jsonDecode(utf8.decode(response.bodyBytes)) as List);
    } else {
      throw ServerException();
    }
  }
}
