import 'package:demo_rvp4/config/theme/app_theme.dart';
import 'package:demo_rvp4/features/project_list/presentations/pages/project_list_page.dart';
import 'package:flutter/material.dart';

class ProjectApp extends StatelessWidget {
  const ProjectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const ProjectListPage(),
    );
  }
}