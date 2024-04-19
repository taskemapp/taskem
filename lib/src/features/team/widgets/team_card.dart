import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/helpers/dimension.dart';
import 'package:taskem/src/features/team/controller/teams/team_bloc.dart';
import 'package:taskem/src/features/team/models/team_model.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    required this.team,
    super.key,
    this.canJoin = false,
    this.onCardPressed,
  });

  final TeamModel team;
  final bool canJoin;
  final VoidCallback? onCardPressed;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Card(
      child: ListTile(
        enableFeedback: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimension.borderRadius,
          ),
        ),
        onTap: onCardPressed,
        title: Text(
          team.name,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(team.description),
            Row(
              children: [
                const Icon(
                  Icons.group,
                  size: 16,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '${team.members.length}',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
        trailing: canJoin
            ? IconButton(
                onPressed: () {
                  context.read<TeamBloc>().add(
                        TeamEvent.join(
                          teamId: team.id,
                          creator: team.creator,
                        ),
                      );
                },
                icon: const Icon(
                  Icons.group_add_outlined,
                  size: 28,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
