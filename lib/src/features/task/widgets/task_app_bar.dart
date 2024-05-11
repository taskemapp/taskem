import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:taskem/src/app.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/helpers/animation_config.dart';
import 'package:taskem/src/core/helpers/platform_check_mixin.dart';
import 'package:taskem/src/core/widgets/hero_dialog_route.dart';
import 'package:taskem/src/core/widgets/image_widget.dart';
import 'package:taskem/src/features/profile/widgets/avatar_update_button.dart';
import 'package:taskem/src/features/profile/widgets/profile_avatar.dart';
import 'package:taskem/src/i18n/translations.g.dart';

class TaskAppBarTitle extends StatefulWidget {
  const TaskAppBarTitle({super.key});

  @override
  State<TaskAppBarTitle> createState() => _TaskAppBarTitleState();
}

class _TaskAppBarTitleState extends State<TaskAppBarTitle> with PlatformCheck {
  late final Stream<DateTime> titleDateStream;

  bool _imageError = false;

  @override
  void initState() {
    titleDateStream = Stream.periodic(const Duration(minutes: 1), (count) {
      return DateTime.now();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final url =
        'http://kissota.ru:9600/file/users/${context.read<LoggedInState>().state!.name}/avatar.jpg';
    final token = context.read<LoggedInState>().state!.token;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StreamBuilder<DateTime>(
          stream: titleDateStream,
          builder: (context, snapshot) {
            return Text(
              DateFormat(
                'd MMMM, y',
                LocaleSettings.currentLocale.languageCode,
              ).format(
                snapshot.data ?? DateTime.now(),
              ),
            );
          },
        ),
        if (!_imageError)
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              HeroDialogRoute<void>(
                builder: (_) => _ProfileAvatarDialog(
                  url: url,
                  token: token,
                ),
              ),
            ),
            child: Hero(
              tag: url,
              child: ProfileAvatar(
                url: url,
                token: token,
                onBackgroundImageError: (e, st) {
                  setState(() {
                    _imageError = true;
                  });
                },
              ),
            ),
          )
        else
          const AvatarUpdateButton(),
      ],
    );
  }
}

class _ProfileAvatarDialog extends StatelessWidget with PlatformCheck {
  const _ProfileAvatarDialog({
    required this.url,
    required this.token,
    super.key,
  });

  final String url;
  final String token;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Hero(
        tag: url,
        child: IntrinsicHeight(
          child: Stack(
            children: [
              ImageWidget(
                url: url,
                httpHeaders: {
                  'authorization': token,
                },
                errorWidget: (
                  context,
                  url,
                  error,
                ) =>
                    const Icon(
                  Icons.error,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Animate(
                  effects: const [
                    FadeEffect(
                      delay: AnimationConfig.longDuration,
                      duration: AnimationConfig.shortDuration,
                    ),
                  ],
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AvatarUpdateButton(),
                      // IconButton.filledTonal(
                      //   onPressed: () {},
                      //   icon: Icon(
                      //     isCupertino
                      //         ? CupertinoIcons.download_circle
                      //         : Icons.download_rounded,
                      //   ),
                      // ),
                    ],
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
