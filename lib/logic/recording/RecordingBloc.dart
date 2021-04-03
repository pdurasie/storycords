import 'package:bloc/bloc.dart';
import 'package:storycords/logic/recording/RecordingEvent.dart';
import 'package:storycords/logic/recording/RecordingService.dart';
import 'package:storycords/logic/recording/RecordingState.dart';

class RecordingBloc extends Bloc<RecordingEvent, RecordingState> {
  final RecordingService _recordingService;

  RecordingBloc(this._recordingService) : super(RecordingInitial());

  @override
  Stream<RecordingState> mapEventToState(RecordingEvent event) async* {
    try {
      if (event is RecordingStarted) {
        _recordingService.record();
        yield RecordingInProgress();
      } else if (event is RecordingResumed) {
        _recordingService.resumeRecording();
        yield RecordingInProgress();
      } else if (event is RecordingPaused) {
        _recordingService.pauseRecording();
        yield RecordingIsOnHold();
      } else if (event is RecordingEnded) {
        String? url = await _recordingService.stopRecording();
        if (url != null)
          yield RecordingSuccess(url);
        else
          yield RecordingFailure();
      }
    } catch (_) {
      //_recordingService.flush();
      yield RecordingFailure();
    }
  }
}
