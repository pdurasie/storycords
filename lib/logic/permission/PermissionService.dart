import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:storycords/logic/permission/PermissionState.dart';

enum PermissionType {
  Microphone,
}

/// This class is responsible for getting permissions from the system.
///
///
class PermissionService {
  static Future<PermissionState> ensurePermission(
      PermissionType permissionType) async {
    Permission permission = _mapPermissionTypeToPermission(permissionType);

    //Does this work as expected? For my test device it showed me the
    // system dialog right away
    if (await _shouldShowRationale(permission)) {
      return PermissionShowRationale();
    } else {
      PermissionStatus status = await permission.request();
      return _mapStatusToPermissionState(status);
    }
  }

  /// Is needed so we don't depend on "Permission" from external library.
  static PermissionState _mapStatusToPermissionState(PermissionStatus status) {
    if (status.isGranted || status.isLimited) {
      return PermissionGranted();
    } else if (status.isPermanentlyDenied) {
      return PermissionDeniedPermanently();
    } else if (status.isRestricted) {
      return PermissionRestricted();
    } else {
      return PermissionDenied();
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

  static openAppSettingsForPermission() {
    openAppSettings();
  }

  /// Is needed so we don't have to use the libraries "Permission" class but can
  /// use our own PermissionType enum.
  static Permission _mapPermissionTypeToPermission(PermissionType type) {
    switch (type) {
      case PermissionType.Microphone:
        return Permission.microphone;
      default:
        throw UnimplementedError("Unknown permission type");
    }
  }
}
