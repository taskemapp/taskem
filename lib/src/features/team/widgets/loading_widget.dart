import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.iconVisible = true,
    this.fullCardShimmer = false,
  });

  final bool iconVisible;

  final bool fullCardShimmer;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      child: ListView.builder(
        itemCount: 6,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Skeleton.leaf(
            enabled: fullCardShimmer,
            child: Card(
              child: ListTile(
                title: const Bone.text(
                  words: 3,
                ),
                subtitle: const Bone.text(
                  words: 2,
                ),
                trailing: iconVisible
                    ? const Bone.icon(
                        size: 32,
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          );
        },
      ),
    );
  }
}
