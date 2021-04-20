import 'package:bloc/bloc.dart';
import 'package:tonband/logic/recording/RecordingEvent.dart';
import 'package:tonband/logic/recording/RecordingService.dart';
import 'package:tonband/logic/recording/RecordingState.dart';

class RecordingBloc extends Bloc<RecordingEvent, RecordingState> {
  RecordingBloc() : super(RecordingInitial());

  @override
  Stream<RecordingState> mapEventToState(RecordingEvent event) async* {
    try {
      if (event is RecordingStarted) {
        RecordingService.record();
        yield RecordingInProgress();
      } else if (event is RecordingResumed) {
        //recordingService.resumeRecording();
        yield RecordingInProgress();
      } else if (event is RecordingPaused) {
        //recordingService.pauseRecording();
        yield RecordingIsOnHold();
      } else if (event is RecordingEnded) {
        await RecordingService.stopRecording();
        yield RecordingSuccess();
      }
    } catch (_) {
      //_recordingService.flush();
      yield RecordingFailure();
    }
  }
}
