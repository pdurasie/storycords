
import 'package:permission_handler/permission_handler.dart';

enum PermissionType {
  Microphone,
}

/// This class is responsible for getting permissions from the system..
///
///
class PermissionService {
  static ensurePermission(PermissionType permissionType) async {
    switch (permissionType) {
      case PermissionType.Microphone:
        await _getMicrophonePermission();
        break;
      default:
        break;
    }
  }

  static _getMicrophonePermission() async {
    //bloc state : Requesting -> show rationale
    PermissionStatus status = await Permission.microphone.request();
    _handleStatus(status);
  }

  static openAppSettingsForPermission() {
    openAppSettings();
  }

  static _handleStatus(PermissionStatus status) {
    if (status.isGranted || status.isLimited) {
      return;
    } else if (status.isPermanentlyDenied) {
      //set bloc state permanently denied -> show dialog leading to app settings.Pass on the function to do that
    } else if (status.isRestricted) {
      // set bloc state restricted
    } else {
  //set bloc state denied-> show dialog
  }
}
