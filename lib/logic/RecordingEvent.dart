import 'dart:core';

abstract class RecordingEvent {}

class RecordingStarted extends RecordingEvent {}

class RecordingPaused extends RecordingEvent {}

class RecordingResumed extends RecordingEvent {}

class RecordingEnded extends RecordingEvent {}
