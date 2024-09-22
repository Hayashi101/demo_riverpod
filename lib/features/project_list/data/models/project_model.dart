import 'package:demo_rvp4/features/project_list/domain/entities/project_dto.dart';

class BaseAddressModel extends BaseAddress {
  const BaseAddressModel({
    String? fullAddress,
    double? latitude,
    double? longitude,
  }) : super(
          fullAddress: fullAddress ?? '',
          latitude: latitude ?? 0,
          longitude: longitude ?? 0,
        );

  factory BaseAddressModel.fromJson(Map<String, dynamic> json) {
    return BaseAddressModel(
      fullAddress: json['full_address'] ?? '',
      latitude: json['latitude'] ?? 0,
      longitude: json['longitude'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_address': fullAddress,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

class ProjectModel extends ProjectDto {
  const ProjectModel({
    required BaseAddressModel address,
    required String fullSizeImage,
    required String id,
    required String name,
    required String slugs,
  }) : super(
          address: address,
          fullSizeImage: fullSizeImage,
          id: id,
          name: name,
          slugs: slugs,
        );

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      address: (json['address'] == null)
          ? const BaseAddressModel()
          : BaseAddressModel.fromJson(json['address']),
      fullSizeImage: json['full_size_image'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      slugs: json['slugs'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'full_size_image': fullSizeImage,
      'id': id,
      'name': name,
      'slugs': slugs,
    };
  }

  static List<ProjectModel> fromJsonList(List json) {
    return json
        .map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<ProjectModel> list) {
    return list.map((e) => e.toJson()).toList();
  }
}
