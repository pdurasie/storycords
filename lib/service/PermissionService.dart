import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:storycords/logic/PermissionCubit.dart';

enum PermissionType {
  Microphone,
}

/// This class is responsible for getting permissions from the system..
///
///
class PermissionService {

  final PermissionCubit _permissionCubit

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
    if (await Permission.microphone.isGranted) {
      return;
    } else {
      //bloc state : Requesting -> show rationale
      PermissionStatus status = await Permission.microphone.request();
      _handleStatus(status);
    }
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

  static Future<bool> _shouldShowRationale(Permission permission) async {
    if (Platform.isAndroid) {
      return await permission.shouldShowRequestRationale;
    } else {
      //if is first show, return true else false
      return true;
    }
  }
}
