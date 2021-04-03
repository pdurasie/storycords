import 'dart:io';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';

/// This class is responsible for capturing sound.
///
/// It uses the [FlutterSoundRecorder] to manage this under the hood.
class RecordingService {
  FlutterSoundRecorder _soundRecorder;

  RecordingService(this._soundRecorder);

  record() async {
    await _soundRecorder.openAudioSession();
    Directory tempDir = await getApplicationDocumentsDirectory();
    String tempPath = tempDir.path;
    _soundRecorder.startRecorder(
        toFile: '${tempPath}/foo.aac', codec: Codec.aacMP4);
  }

  Codec _getCodec() {
    return Platform.isAndroid ? Codec.opusWebM : Codec.opusCAF;
  }

  pauseRecording() {
    _soundRecorder.pauseRecorder();
  }

  resumeRecording() {
    _soundRecorder.resumeRecorder();
  }

  Future<String?> stopRecording() async {
    return await _soundRecorder.stopRecorder();
  }
}
