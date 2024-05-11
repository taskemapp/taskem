part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {
  const ProfileEvent();

  const factory ProfileEvent.updateAvatar(Uint8List avatar) = _UpdateAvatar;
}

final class _UpdateAvatar extends ProfileEvent {
  const _UpdateAvatar(this.avatar);

  final Uint8List avatar;
}
