import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/helpers/dimension.dart';
import 'package:taskem/src/core/helpers/platform_check_mixin.dart';
import 'package:taskem/src/core/widgets/info_text.dart';
import 'package:taskem/src/core/widgets/try_again_button.dart';
import 'package:taskem/src/features/team/controller/teams/team_bloc.dart';
import 'package:taskem/src/features/team/widgets/loading_widget.dart';
import 'package:taskem/src/features/team/widgets/team_card.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen>
    with PlatformCheck, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = context.theme;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimension.screenPadding,
      ),
      child: BlocConsumer<TeamBloc, TeamState>(
        listener: (context, state) {
          if (state is TeamCreated) {
            context.read<TeamBloc>().add(const TeamEvent.getTeams());
          }
        },
        builder: (context, state) {
          return switch (state) {
            TeamsLoaded(teams: final teams) => teams.isNotEmpty
                ? RefreshIndicator(
                    onRefresh: () async {
                      context.read<TeamBloc>().add(const TeamEvent.getTeams());
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverList.builder(
                          itemCount: teams.length,
                          itemBuilder: (context, index) {
                            final team = teams[index];
                            return TeamCard(
                              team: team,
                              canJoin: true,
                            );
                          },
                        ),
                      ],
                    ).animate().fade(),
                  )
                : const Center(
                    child: InfoText(
                      title: 'Нет команд',
                    ),
                  ).animate().fade(),
            TeamError() => Center(
                child: TryAgainButton(
                  onPressed: () =>
                      context.read<TeamBloc>().add(const TeamEvent.getTeams()),
                ),
              ),
            _ => const LoadingWidget(),
          };
        },
      ),
    );
  }
}
