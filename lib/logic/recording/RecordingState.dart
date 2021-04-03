abstract class RecordingState {
  const RecordingState();
}

class RecordingInitial extends RecordingState {}

class RecordingInProgress extends RecordingState {}

class RecordingIsOnHold extends RecordingState {}

class RecordingSuccess extends RecordingState {
  final String soundUrl;

  const RecordingSuccess(this.soundUrl);
}

class RecordingFailure extends RecordingState {}
