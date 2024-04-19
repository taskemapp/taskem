import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:taskem/src/core/extensions/color_extension.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/helpers/dimension.dart';
import 'package:taskem/src/core/helpers/platform_check_mixin.dart';

class TaskDateCarousel extends StatefulWidget {
  const TaskDateCarousel({
    required this.onDateChange,
    required this.duration,
    super.key,
  });

  final void Function(DateTime date) onDateChange;

  final Duration duration;

  @override
  State<TaskDateCarousel> createState() => _TaskDateCarouselState();
}

class _TaskDateCarouselState extends State<TaskDateCarousel>
    with PlatformCheck {
  DateTime currentDate = DateTime.now();
  final List<DateTime> dates = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i <= 14; i++) {
      dates.add(
        DateTime.now().add(
          Duration(days: i),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: dates.length,
      padding: EdgeInsets.symmetric(
        horizontal: Dimension.screenPadding,
        vertical: Dimension.screenPadding / 2,
      ),
      itemBuilder: (context, index) {
        final date = dates[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(
            Dimension.borderRadius,
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                HapticFeedback.lightImpact();
                currentDate = date;
                widget.onDateChange(currentDate);
              });
            },
            borderRadius: BorderRadius.circular(
              Dimension.borderRadius,
            ),
            splashFactory:
                isCupertino ? InkRipple.splashFactory : NoSplash.splashFactory,
            child: AnimatedContainer(
              width: 60,
              color: index ==
                      dates.indexWhere(
                        (element) => element.day == currentDate.day,
                      )
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.secondaryContainer.withSaturation(.05),
              duration: widget.duration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('E').format(
                      date,
                    ),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: index == 0 ? null : theme.colorScheme.onSurface,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                    ),
                    child: Text(
                      DateFormat('d').format(
                        date,
                      ),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                  Text(
                    DateFormat('MMM').format(
                      date,
                    ),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: index == 0 ? theme.colorScheme.primary : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(width: 12);
      },
    );
  }
}
