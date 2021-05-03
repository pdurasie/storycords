import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

/// This class is responsible for capturing sound.
///
/// It uses [Record] to manage this under the hood.
class RecordingService {
  static record() async {
    //TODO I have to test the Permissioning again because of rationaling
    // TODO implement more logic for sound effect injection?
    // TODO implement running timer
    // await PermissionService.ensurePermission(PermissionType.Microphone);
    // TODO: only available on Android
    Directory tempDir = (await getExternalStorageDirectory())!;
    String tempPath = tempDir.path;
    // TODO use dynamic codec
    Record.start(path: '${tempPath}/foo.m4a');
  }

/*
  Codec _getCodec() {
    return Platform.isAndroid ? Codec.opusWebM : Codec.opusCAF;
  }

  pauseRecording() {
    _soundRecorder.pauseRecorder();
  }

  resumeRecording() {
    _soundRecorder.resumeRecorder();
  }
*/
  static stopRecording() async {
    await Record.stop();
  }
}
