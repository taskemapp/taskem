import 'package:meta/meta.dart';

@immutable
sealed class TaskStatus {
  const TaskStatus();

  const factory TaskStatus.canceled() = _CanceledStatus;
  const factory TaskStatus.finished() = _FinishedStatus;
  const factory TaskStatus.inProgress() = _InProgressStatus;
  const factory TaskStatus.paused() = _PausedStatus;
}

final class _FinishedStatus extends TaskStatus {
  const _FinishedStatus();

  String get name => 'finished';

  @override
  String toString() {
    return name;
  }
}

final class _InProgressStatus extends TaskStatus {
  const _InProgressStatus();

  String get name => 'in progress';

  @override
  String toString() {
    return name;
  }
}

final class _PausedStatus extends TaskStatus {
  const _PausedStatus();

  String get name => 'paused';

  @override
  String toString() {
    return name;
  }
}

final class _CanceledStatus extends TaskStatus {
  const _CanceledStatus();

  String get name => 'canceled';

  @override
  String toString() {
    return name;
  }
}
