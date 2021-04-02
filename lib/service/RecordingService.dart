import 'dart:io';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:storycords/service/PermissionService.dart';

/// This class is responsible for capturing sound.
///
/// It uses the [FlutterSoundRecorder] to manage this under the hood.
class RecordingService {
  FlutterSoundRecorder _soundRecorder;

  RecordingService(this._soundRecorder);

  record() async {
    await PermissionService.ensurePermission(PermissionType.Microphone);
    //TODO if permission state != errorful
    _soundRecorder.openAudioSession();
    await _soundRecorder.startRecorder(codec: _getCodec());
  }

  Codec _getCodec() {
    return Platform.isAndroid ? Codec.opusWebM : Codec.opusCAF;
  }
}
