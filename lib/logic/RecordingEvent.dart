import 'dart:core';

abstract class RecordingEvent {}

//enum

class RecordingStarted extends RecordingEvent {}

class RecordingPaused extends RecordingEvent {}

class RecordingResumed extends RecordingEvent {}

class RecordingEnded extends RecordingEvent {}
