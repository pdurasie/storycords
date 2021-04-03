abstract class RecordingEvent {}

class RecordingStarted extends RecordingEvent {}

class RecordingPaused extends RecordingEvent {}

class RecordingResumed extends RecordingEvent {}

class RecordingEnded extends RecordingEvent {}

/*

class RecordingUploaded extends RecordingState {}

class RecordingSavedToDisk extends RecordingState {}
 */
