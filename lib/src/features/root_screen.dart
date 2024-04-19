import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskem/src/core/helpers/platform_check_mixin.dart';

class RootScreen extends StatelessWidget with PlatformCheck {
  const RootScreen({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: [
          NavigationDestination(
            icon: Icon(
              isCupertino ? CupertinoIcons.home : Icons.home,
            ),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(
              isCupertino ? CupertinoIcons.group : Icons.group,
            ),
            label: 'Команды',
          ),
        ],
      ),
    );
  }
}
