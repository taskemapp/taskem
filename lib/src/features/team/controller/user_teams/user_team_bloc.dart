import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskem/src/features/team/models/team_model.dart';
import 'package:taskem/src/features/team/repositories/team_repository.dart';

part 'user_team_event.dart';
part 'user_team_state.dart';

class UserTeamBloc extends Bloc<UserTeamEvent, UserTeamState> {
  UserTeamBloc({
    required TeamRepository teamRepository,
  })  : _teamRepository = teamRepository,
        super(const UserTeamInitial()) {
    on<UserTeamEvent>(
      (event, emit) => switch (event) {
        _GetUserTeamsEvent() => _onGetUserTeams(event, emit),
      },
    );
  }

  final TeamRepository _teamRepository;

  Future<void> _onGetUserTeams(
    _GetUserTeamsEvent event,
    Emitter<UserTeamState> emit,
  ) async {
    try {
      emit(const UserTeamState.init());
      final response = await _teamRepository.getUserTeams();
      if (response.isEmpty) {
        emit(const UserTeamState.userTeamsEmpty());
        return;
      }
      emit(UserTeamState.userLoaded(response));
    } catch (e) {
      emit(UserTeamState.error(e.toString()));
      rethrow;
    }
  }
}
