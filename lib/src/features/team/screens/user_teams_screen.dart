import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/helpers/dimension.dart';
import 'package:taskem/src/core/helpers/snack_bar_service.dart';
import 'package:taskem/src/core/widgets/try_again_button.dart';
import 'package:taskem/src/features/team/controller/teams/team_bloc.dart';
import 'package:taskem/src/features/team/controller/user_teams/user_team_bloc.dart';
import 'package:taskem/src/features/team/widgets/loading_widget.dart';
import 'package:taskem/src/features/team/widgets/team_card.dart';
import 'package:taskem/src/routes/routes.dart';
import 'package:taskem/src/routes/screen_route_builder.dart';

class UserTeamScreen extends StatefulWidget {
  const UserTeamScreen({required this.onJoinPressed, super.key});

  final VoidCallback onJoinPressed;

  @override
  State<UserTeamScreen> createState() => _UserTeamScreenState();
}

class _UserTeamScreenState extends State<UserTeamScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    context.read<UserTeamBloc>().add(const UserTeamEvent.getUserTeams());
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final translation = context.translation;
    final theme = context.theme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => context.read<UserTeamBloc>().add(
                const UserTeamEvent.getUserTeams(),
              ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimension.screenPadding,
            ),
            child: BlocListener<TeamBloc, TeamState>(
              listener: (context, state) {
                if (state is TeamCreated) {
                  SnackBarService.info(context, 'Команда создана');
                  context.read<UserTeamBloc>().add(
                        const UserTeamEvent.getUserTeams(),
                      );
                }
              },
              child: BlocBuilder<UserTeamBloc, UserTeamState>(
                builder: (context, state) {
                  return switch (state) {
                    UserTeamsLoaded(teams: final teams) => CustomScrollView(
                        slivers: [
                          SliverList.builder(
                            itemCount: teams.length,
                            itemBuilder: (context, index) {
                              final team = teams[index];
                              return TeamCard(
                                onCardPressed: () => context.push(
                                  ScreenRouteBuilder()
                                      .path(ScreenRoutes.team)
                                      .param(team.id)
                                      .build(),
                                ),
                                team: team,
                              );
                            },
                          ),
                        ],
                      ).animate().fade(),
                    UserTeamsEmpty() => Stack(
                        children: [
                          ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            children: [
                              SizedBox(
                                height: context.screenHeight,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimension.screenPadding,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 230,
                                    child: Text(
                                      translation.team.notFound,
                                      style: theme.textTheme.bodyLarge,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  FilledButton.icon(
                                    onPressed: widget.onJoinPressed,
                                    icon: const Icon(
                                      Icons.group_add,
                                    ),
                                    label: Text(
                                      translation.team.join,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    UserTeamInitial() => const LoadingWidget(),
                    _ => Center(
                        child: TryAgainButton(
                          onPressed: () => context
                              .read<UserTeamBloc>()
                              .add(const UserTeamEvent.getUserTeams()),
                        ),
                      ),
                  };
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
