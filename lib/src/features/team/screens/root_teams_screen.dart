import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remove_emoji/remove_emoji.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/helpers/dimension.dart';
import 'package:taskem/src/core/helpers/platform_check_mixin.dart';
import 'package:taskem/src/core/widgets/custom_text_field.dart';
import 'package:taskem/src/features/team/controller/teams/team_bloc.dart';
import 'package:taskem/src/features/team/screens/teams_screen.dart';
import 'package:taskem/src/features/team/screens/user_teams_screen.dart';

class RootTeamsScreen extends StatefulWidget {
  const RootTeamsScreen({super.key});

  @override
  State<RootTeamsScreen> createState() => _RootTeamsScreenState();
}

class _RootTeamsScreenState extends State<RootTeamsScreen>
    with TickerProviderStateMixin, PlatformCheck {
  late final TabController _controller;
  int index = 0;
  final List<Tab> tabs = [
    const Tab(text: 'Ваши'),
    const Tab(text: 'Все'),
  ];
  void _openCreateTeamBottomSheet(BuildContext context) {
    showFlexibleBottomSheet<TeamEvent>(
      context: context,
      initHeight: 0.5,
      maxHeight: 0.85,
      anchors: [0.5, 0.85],
      isSafeArea: true,
      builder: (
        modalContext,
        scrollController,
        bottomSheetOffset,
      ) {
        return _CreateTeamForm(
          bloc: context.read<TeamBloc>(),
          scrollController: scrollController,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<TeamBloc>().add(const TeamEvent.getTeams());
    _controller = TabController(
      length: tabs.length,
      vsync: this,
      initialIndex: index,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Команды'),
        actions: [
          MenuAnchor(
            menuChildren: [
              InkWell(
                onTap: () {
                  _openCreateTeamBottomSheet(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Text('Создать команду'),
                ),
              ),
            ],
            builder: (context, controller, child) {
              return IconButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                icon: const Icon(
                  Icons.more_vert,
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          splashBorderRadius: BorderRadius.circular(
            Dimension.borderRadius,
          ),
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: theme.textTheme.bodyMedium,
          unselectedLabelStyle: theme.textTheme.labelLarge,
          splashFactory:
              isCupertino ? NoSplash.splashFactory : InkSparkle.splashFactory,
          onTap: (value) => index = value,
          tabs: tabs,
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _controller,
          children: [
            UserTeamScreen(
              onJoinPressed: () {
                _controller.index = 1;
              },
            ),
            const TeamsScreen(),
          ],
        ),
      ),
    );
  }
}

class _CreateTeamForm extends StatefulWidget {
  const _CreateTeamForm({
    required this.bloc,
    required this.scrollController,
  });

  final TeamBloc bloc;
  final ScrollController scrollController;

  @override
  State<_CreateTeamForm> createState() => _CreateTeamFormState();
}

class _CreateTeamFormState extends State<_CreateTeamForm> with PlatformCheck {
  late final TextEditingController teamNameController;
  late final TextEditingController teamDescriptionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    teamNameController = TextEditingController();
    teamDescriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: const EdgeInsets.all(16).copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      duration: const Duration(
        milliseconds: 200,
      ),
      child: Material(
        child: Form(
          key: _formKey,
          child: ListView(
            controller: widget.scrollController,
            physics: const ClampingScrollPhysics(),
            children: [
              CustomTextField(
                title: 'Название',
                maxLength: 25,
                controller: teamNameController,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                title: 'Описание',
                canBeEmpty: true,
                controller: teamDescriptionController,
                maxLines: 5,
              ),
              const SizedBox(
                height: 18,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.bloc.add(
                        TeamEvent.create(
                          name: teamNameController.text.trim(),
                          description:
                              teamDescriptionController.text.removEmoji,
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    isCupertino ? CupertinoIcons.add : Icons.add,
                  ),
                  label: const Text(
                    'Создать',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
