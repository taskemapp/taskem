import 'dart:developer';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskem/src/app.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/helpers/dimension.dart';
import 'package:taskem/src/core/helpers/platform_check_mixin.dart';
import 'package:taskem/src/core/helpers/snack_bar_service.dart';
import 'package:taskem/src/core/widgets/expanded_down_field.dart';
import 'package:taskem/src/core/widgets/info_text.dart';
import 'package:taskem/src/core/widgets/try_again_button.dart';
import 'package:taskem/src/features/profile/widgets/profile_avatar.dart';
import 'package:taskem/src/features/shared/model/user_info_model.dart';
import 'package:taskem/src/features/task/models/task_model.dart';
import 'package:taskem/src/features/task/models/task_status.dart';
import 'package:taskem/src/features/team/controller/specific_team/specific_team_bloc.dart';
import 'package:taskem/src/features/team/controller/team_task/team_task_bloc.dart';
import 'package:taskem/src/features/team/models/team_model.dart';
import 'package:taskem/src/features/team/widgets/loading_widget.dart';
import 'package:taskem/src/routes/routes.dart';
import 'package:taskem/src/routes/screen_route_builder.dart';

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
        SpecificTeamInitial() => Animate(
            effects: const [
              FadeEffect(),
            ],
            child: Scaffold(
              appBar: AppBar(
                title: const Skeletonizer(
                  child: Bone.text(
                    words: 1,
                  ),
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(Dimension.screenPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeletonizer.zone(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Bone.text(
                                style: theme.textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 8),
                              const Bone.multiText(
                                lines: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Expanded(
                        child: LoadingWidget(
                          iconVisible: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        SpecificTeamError() => Animate(
            effects: const [
              FadeEffect(),
            ],
            child: Scaffold(
              body: Center(
                child: TryAgainButton(
                  onPressed: () => context.read<SpecificTeamBloc>().add(
                        SpecificTeamEvent.getTeam(teamId: widget.id),
                      ),
                ),
              ),
            ),
          ),
        SpecificTeamLoaded(team: final team) => Animate(
            effects: const [
              FadeEffect(),
            ],
            child: _TeamLoaded(
              team: team,
            ),
          ),
      },
    );
  }
}
