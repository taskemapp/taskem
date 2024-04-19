import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskem/src/features/team/models/team_model.dart';
import 'package:taskem/src/features/team/repositories/team_repository.dart';

part 'specific_team_event.dart';
part 'specific_team_state.dart';

class SpecificTeamBloc extends Bloc<SpecificTeamEvent, SpecificTeamState> {
  SpecificTeamBloc({
    required TeamRepository teamRepository,
  })  : _teamRepository = teamRepository,
        super(const SpecificTeamInitial()) {
    on<SpecificTeamEvent>(
      (event, emit) => switch (event) {
        _GetSpecificTeam() => _onGetSpecificTeam(event, emit),
      },
    );
  }

  final TeamRepository _teamRepository;

  Future<void> _onGetSpecificTeam(
    _GetSpecificTeam event,
    Emitter<SpecificTeamState> emit,
  ) async {
    try {
      emit(const SpecificTeamState.init());
      final response = await _teamRepository.getTeam(event.teamId);
      emit(SpecificTeamState.loaded(team: response));
    } catch (e) {
      emit(
        SpecificTeamState.error(
          message: e.toString(),
        ),
      );
      rethrow;
    }
  }
}
