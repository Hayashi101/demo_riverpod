import 'package:demo_rvp4/features/project_list/domain/entities/project_dto.dart';
import 'package:demo_rvp4/features/project_list/presentations/providers/project_list_provider.dart';
import 'package:demo_rvp4/features/project_list/presentations/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class ProjectListPage extends ConsumerStatefulWidget {
  const ProjectListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProjectListPageState();
}

class _ProjectListPageState extends ConsumerState<ProjectListPage> {
  final ScrollController _scrollController = ScrollController();
  bool _loading = false;
  final bool _finished = false;

  final int _limit = 10;

  List<ProjectDto> _projects = [];

  @override
  void initState() {
    super.initState();
    getProjectList();
    _scrollController.addListener(_scrollListener);
  }

  getProjectList() {
    setState(() {
      _loading = true;
    });
    ref
        .read(projectListNotifierProvider.notifier)
        .getProjectList(_limit, _projects.length)
        .whenComplete(() {
      debugPrint('complete');
      setState(() {
        _loading = false;
      });
    });
  }

  _scrollListener() {
    if (_loading == true) return;
    if (_finished == true) return;

    if (_scrollController.position.pixels >=
        (_scrollController.position.maxScrollExtent * 0.9)) {
      debugPrint('ENdd');
      // setState(() {
      //   _finished = true;
      // });
      getProjectList();

      // getProjectList();
      //  ref.watch(projectListNotifierProvider.notifier).getProjectList(10, projecList.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final projects = getProject(ref.watch(projectListNotifierProvider));
    _projects = ref.watch(projectListNotifierProvider);

    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ListView.separated(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: _projects.length,
              separatorBuilder: (context, index) => const Gap(10),
              itemBuilder: (context, index) {
                return ProjectCard(
                  project: _projects[index],
                );
              },
            ),
          ),
          ElevatedButton(
            child: const Text('Load more'),
            onPressed: () {
              print('load more');
              getProjectList();
            },
          )
        ],
      ),
    ));
  }

}
/*
class ProjectListPage extends ConsumerWidget {
  ProjectListPage({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(projectListNotifierProvider.notifier).getProjectList(10, 0);
    final projecList = ref.watch(projectListNotifierProvider);

    _scrollController.addListener(() {
       if (_scrollController.position.pixels >=
        (_scrollController.position.maxScrollExtent * 0.8)) {
      // if (_finished == true) return;
      //  ref.watch(projectListNotifierProvider.notifier).getProjectList(10, projecList.length);
    }
    });

    return Scaffold(
        body: SafeArea(
      child: ListView.separated(
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: projecList.length,
        separatorBuilder: (context, index) => const Gap(10),
        itemBuilder: (context, index) {
          return ProjectCard(
            project: projecList[index],
          );
        },
      ),
    ));
  }
}
*/