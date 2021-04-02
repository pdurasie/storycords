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
    //external library? what does it return?
  }
}
