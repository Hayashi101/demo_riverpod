import 'package:equatable/equatable.dart';

class BaseAddress extends Equatable {
  const BaseAddress({
    required this.fullAddress,
    required this.latitude,
    required this.longitude,
  });

  final String fullAddress;
  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => [fullAddress, latitude, longitude];
}

class ProjectDto extends Equatable {
  final BaseAddress address;
  final String fullSizeImage;
  final String id;
  final String name;
  final String slugs;

  const ProjectDto(
      {required this.address,
      required this.fullSizeImage,
      required this.id,
      required this.name,
      required this.slugs});

  @override
  List<Object?> get props => [address, fullSizeImage, id, name, slugs];
}
