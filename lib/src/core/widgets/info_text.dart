import 'package:flutter/material.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/helpers/dimension.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final borderRadius = BorderRadius.circular(
      Dimension.borderRadius,
    );
    return Material(
      elevation: 1,
      borderRadius: borderRadius,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: ColoredBox(
          color: theme.colorScheme.onTertiary,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.tertiary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
