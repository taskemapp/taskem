import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return const Card(
            child: ListTile(
              title: Text('Some team name'),
              subtitle: Text('Some info here'),
              trailing: Icon(
                Icons.group_add_outlined,
                size: 32,
              ),
            ),
          );
        },
      ),
    );
  }
}
