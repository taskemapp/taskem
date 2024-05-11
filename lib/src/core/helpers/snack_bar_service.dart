import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';

///Custom snack bar service
abstract final class SnackBarService {
  ///Show error snack bar
  static void error(
    BuildContext context,
    String errorMessage,
  ) {
    final theme = context.theme;
    // final height =
    //     (size.height * 0.023 < 20 ? 20 : size.height * 0.023).toDouble();
    ScaffoldMessenger.of(context).showSnackBar(
      snackBarAnimationStyle: AnimationStyle(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
      ),
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: theme.colorScheme.errorContainer,
        content: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 100,
            maxWidth: context.screenWidth,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  errorMessage,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(
                  CupertinoIcons.exclamationmark_octagon,
                  size: 20,
                  color: theme.colorScheme.error,
                ),
              ),
            ],
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(12),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void info(
    BuildContext context,
    String message, {
    int? lines,
  }) {
    final theme = context.theme;

    // final height =
    //     (size.height * 0.023 < 20 ? 20 : size.height * 0.023).toDouble();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: theme.colorScheme.secondaryContainer,
        content: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 100,
            maxWidth: context.screenWidth,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  message,
                  maxLines: lines ?? 1,
                  softWrap: lines != null && lines > 1,
                  overflow: TextOverflow.fade,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(12),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
