import 'package:demo_rvp4/core/platform/network_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final internetCheckerProvider = Provider<InternetConnectionChecker>((ref) {
  return InternetConnectionChecker();
});

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  final internetChecker = ref.read(internetCheckerProvider);
  return NetworkInfoImpl(internetChecker);
});
