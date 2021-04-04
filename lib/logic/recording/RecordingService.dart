import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:storycords/logic/permission/PermissionService.dart';

/// This class is responsible for capturing sound.
///
/// It uses [Record] to manage this under the hood.
class RecordingService {
  static record() async {
    //TODO I have to test the Permissioning again because of rationaling
    // TODO implement more logic for sound effect injection?
    await PermissionService.ensurePermission(PermissionType.Microphone);
    // TODO: only available on Android
    Directory tempDir = (await getExternalStorageDirectory())!;
    String tempPath = tempDir.path;
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
