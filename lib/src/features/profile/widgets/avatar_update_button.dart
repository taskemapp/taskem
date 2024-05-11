import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/helpers/platform_check_mixin.dart';
import 'package:taskem/src/core/helpers/snack_bar_service.dart';
import 'package:taskem/src/features/profile/controller/profile_bloc.dart';

class AvatarUpdateButton extends StatelessWidget with PlatformCheck {
  const AvatarUpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileError) {
          SnackBarService.error(
            context,
            'Изображение должно быть не более 4 МБ',
          );
        }
        if (state is ProfileUpdated) {
          SnackBarService.info(
            context,
            'Изображение изменено',
          );
          SnackBarService.info(
            context,
            lines: 2,
            'Для обновления изображения перезапустите приложение',
          );
        }
      },
      child: IconButton.filledTonal(
        onPressed: () async {
          final picker = ImagePicker();

          final image = await picker.pickImage(
            source: ImageSource.gallery,
          );

          if (image == null) {
            return;
          }

          if (!context.mounted) {
            return;
          }
          final uiSettings = [
            AndroidUiSettings(
              toolbarColor: theme.colorScheme.secondaryContainer,
              toolbarWidgetColor: theme.colorScheme.onSecondaryContainer,
              initAspectRatio: CropAspectRatioPreset.square,
              hideBottomControls: true,
              lockAspectRatio: true,
            ),
            IOSUiSettings(),
            WebUiSettings(
              context: context,
            ),
          ];

          final croppedFile = await ImageCropper().cropImage(
            sourcePath: image.path,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
            ],
            uiSettings: uiSettings,
          );

          if (croppedFile == null) {
            return;
          }

          final avatar = await FlutterImageCompress.compressWithList(
            await croppedFile.readAsBytes(),
          );

          if (!context.mounted) {
            return;
          }

          context.read<ProfileBloc>().add(
                ProfileEvent.updateAvatar(
                  avatar,
                ),
              );
        },
        icon: Icon(
          isCupertino ? CupertinoIcons.pen : Icons.edit,
        ),
      ),
    );
  }
}
