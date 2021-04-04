abstract class RecordingState {
  const RecordingState();
}

class RecordingInitial extends RecordingState {}

class RecordingInProgress extends RecordingState {}

class RecordingIsOnHold extends RecordingState {}

class RecordingSuccess extends RecordingState {}

class RecordingFailure extends RecordingState {}
