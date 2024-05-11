import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskem/src/features/team/models/create_team_model.dart';
import 'package:taskem/src/features/team/models/team_model.dart';
import 'package:taskem/src/features/team/repositories/error.dart';
import 'package:taskem/src/features/team/repositories/team_repository.dart';

part 'team_event.dart';
part 'team_state.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  TeamBloc({
    required TeamRepository teamRepository,
  })  : _teamRepository = teamRepository,
        super(const TeamInitial()) {
    on<TeamEvent>(
      (event, emit) => switch (event) {
        _GetTeamsEvent() => _onGetTeams(event, emit),
        _CreateTeamEvent() => _onCreateTeam(event, emit),
        _JoinTeamEvent() => _onJoinTeam(event, emit),
      },
    );
  }

  final TeamRepository _teamRepository;

  Future<void> _onGetTeams(
    _GetTeamsEvent event,
    Emitter<TeamState> emit,
  ) async {
    try {
      emit(const TeamState.init());
      final response = await _teamRepository.getTeams();
      if (response.isEmpty) {
        emit(const TeamState.empty());
        return;
      }
      emit(TeamState.loaded(response));
    } catch (e) {
      emit(TeamState.error(e.toString()));
      rethrow;
    }
  }

  Future<void> _onCreateTeam(
    _CreateTeamEvent event,
    Emitter<TeamState> emit,
  ) async {
    try {
      emit(const TeamState.init());
      final model = CreateTeamModel(
        name: event.name,
        description: event.description,
      );
      final response = await _teamRepository.create(
        model,
      );
      emit(
        TeamState.created(response.message),
      );
    } catch (e) {
      emit(TeamState.error(e.toString()));
      rethrow;
    }
  }

  Future<void> _onJoinTeam(
    _JoinTeamEvent event,
    Emitter<TeamState> emit,
  ) async {
    try {
      emit(const TeamState.init());
      final joinResponse =
          await _teamRepository.join(event.teamId, event.creator);
      emit(TeamState.joined(joinResponse));

      final response = await _teamRepository.getTeams();
      if (response.isEmpty) {
        emit(const TeamState.empty());
        return;
      }
      emit(TeamState.loaded(response));
    } on TeamRepositoryJoinError catch (e) {
      emit(TeamState.joinError(e.message ?? ''));
      rethrow;
    } catch (e) {
      emit(TeamState.error(e.toString()));
      rethrow;
    }
  }
}
