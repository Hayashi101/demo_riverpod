import 'package:demo_rvp4/app/project_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: ProjectApp(),
  ));
}
