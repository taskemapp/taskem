part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {
  const ProfileState();

  const factory ProfileState.initial() = ProfileInitial;

  const factory ProfileState.loading() = ProfileLoading;

  const factory ProfileState.error() = ProfileError;

  const factory ProfileState.loaded({
    required String avatar,
    required String userName,
    required String email,
  }) = ProfileLoaded;
}

final class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

final class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

final class ProfileUpdated extends ProfileState {
  const ProfileUpdated();
}

final class ProfileLoaded extends ProfileState {
  const ProfileLoaded({
    required this.avatar,
    required this.userName,
    required this.email,
  });

  final String avatar;
  final String userName;
  final String email;
}

final class ProfileError extends ProfileState {
  const ProfileError();
}
