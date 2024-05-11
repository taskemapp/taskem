import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/helpers/dimension.dart';
import 'package:taskem/src/features/task/models/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.task,
    super.key,
    this.animationDuration,
  });

  final TaskModel task;
  final Duration? animationDuration;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final translation = context.translation;

    return Animate(
      effects: [
        FadeEffect(
          duration: animationDuration ?? const Duration(milliseconds: 200),
        ),
      ],
      child: Padding(
        padding: EdgeInsets.all(Dimension.screenPadding).copyWith(
          bottom: 0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            Dimension.borderRadius,
          ),
          child: ColoredBox(
            color: theme.colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.name,
                        style: theme.textTheme.headlineSmall,
                      ),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: ColoredBox(
                          color: theme.colorScheme.primary,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              DateFormat('HH:mm').format(task.endDate),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color:
                                    theme.colorScheme.surfaceContainerHighest,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${translation.task.perform}: ${task.assignedUsers.length}',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (task.description.trim().isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translation.task.description,
                          style: theme.textTheme.labelMedium,
                        ),
                        Text(task.description),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
