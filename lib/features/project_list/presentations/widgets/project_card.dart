import 'package:demo_rvp4/core/utils/extensions.dart';
import 'package:demo_rvp4/features/project_list/domain/entities/project_dto.dart';
import 'package:demo_rvp4/shared/widgets/display_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final ProjectDto project;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Container(
            width: double.maxFinite,
            height: 190.0,
            color: colors.primaryContainer,
            child: Stack(
              children: [
                buildBackgroundImage(project.fullSizeImage),
                buildContent(context,
                    name: project.name, address: project.address.fullAddress),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBackgroundImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.fill,
      width: double.maxFinite,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        );
      },
    );
  }

  Widget buildContent(BuildContext context,
      {required String name, required String address}) {
    return Container(
      width: double.maxFinite,
      height: 200.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.5)
          ],
              stops: const [
            0.0,
            1.0
          ])),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.up,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FaIcon(
                  FontAwesomeIcons.locationDot,
                  color: Colors.white,
                  size: 14.0,
                ),
                const Gap(8.0),
                Flexible(
                  child: DisplayText(
                    text: address,
                    fontSize: 13.0,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Gap(4.0),
            DisplayText(
              text: name,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
