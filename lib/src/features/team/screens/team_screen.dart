import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/helpers/dimension.dart';
import 'package:taskem/src/core/helpers/platform_check_mixin.dart';
import 'package:taskem/src/core/widgets/info_text.dart';
import 'package:taskem/src/core/widgets/try_again_button.dart';
import 'package:taskem/src/features/shared/model/user_info_model.dart';
import 'package:taskem/src/features/task/models/task_model.dart';
import 'package:taskem/src/features/task/models/task_status.dart';
import 'package:taskem/src/features/task/widgets/user_expanded_down_button.dart';
import 'package:taskem/src/features/team/controller/specific_team/specific_team_bloc.dart';
import 'package:taskem/src/features/team/controller/team_task/team_task_bloc.dart';
import 'package:taskem/src/features/team/models/team_model.dart';
import 'package:taskem/src/features/team/widgets/loading_widget.dart';
import 'package:taskem/src/routes.dart';

part '../widgets/assign_task_form.dart';
part '../widgets/backlog_widget.dart';
part '../widgets/team_loaded.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({
    required this.id,
    super.key,
  });

  final String id;

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> with PlatformCheck {
  @override
  void initState() {
    super.initState();
    context.read<SpecificTeamBloc>().add(
          SpecificTeamEvent.getTeam(teamId: widget.id),
        );
    context.read<TeamTaskBloc>().add(
          TeamTaskEvent.getTasks(teamId: widget.id),
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return BlocBuilder<SpecificTeamBloc, SpecificTeamState>(
      builder: (context, state) => switch (state) {
        SpecificTeamInitial() => Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(Dimension.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skeletonizer(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'header',
                              style: theme.textTheme.bodyLarge,
                            ),
                            const Text('desc'),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: LoadingWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        SpecificTeamError() => Scaffold(
            body: Center(
              child: TryAgainButton(
                onPressed: () => context.read<SpecificTeamBloc>().add(
                      SpecificTeamEvent.getTeam(teamId: widget.id),
                    ),
              ),
            ),
          ),
        SpecificTeamLoaded(team: final team) => _TeamLoaded(
            team: team,
          ),
      },
    );
  }
}
