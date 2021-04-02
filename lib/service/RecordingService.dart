import 'dart:io';

import 'package:flutter_sound/flutter_sound.dart';

/// This class is responsible for capturing sound.
///
/// It uses the [FlutterSoundRecorder] to manage this under the hood.
class RecordingService {
  FlutterSoundRecorder _soundRecorder;

  RecordingService(this._soundRecorder);

  record() async {
    _soundRecorder.openAudioSession();
    await _soundRecorder.startRecorder(codec: _getCodec());
  }

  Codec _getCodec() {
    return Platform.isAndroid ? Codec.opusWebM : Codec.opusCAF;
  }
}
