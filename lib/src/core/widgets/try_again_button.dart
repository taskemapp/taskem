import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskem/src/core/helpers/platform_check_mixin.dart';

class TryAgainButton extends StatelessWidget with PlatformCheck {
  const TryAgainButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      label: const Text('Попробуйте снова'),
      icon: Icon(
        isCupertino ? CupertinoIcons.refresh_thick : Icons.refresh,
      ),
    );
  }
}
