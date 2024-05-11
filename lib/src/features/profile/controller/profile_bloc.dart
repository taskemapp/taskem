import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskem/src/features/profile/repositories/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required ProfileRepository profileRepository,
  })  : _profileRepository = profileRepository,
        super(const ProfileInitial()) {
    on<ProfileEvent>(
      (event, emit) => switch (event) {
        _UpdateAvatar() => _updateAvatar(event, emit),
      },
    );
  }

  final ProfileRepository _profileRepository;

  Future<void> _updateAvatar(
    _UpdateAvatar event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    try {
      await _profileRepository.addOrUpdateAvatar(
        event.avatar,
      );

      emit(const ProfileUpdated());
    } catch (e) {
      emit(const ProfileState.error());
      rethrow;
    }
  }
}
