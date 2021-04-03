abstract class PermissionState {
  const PermissionState();
}

class PermissionInitial extends PermissionState {}

class PermissionDeniedPermanently extends PermissionState {}

class PermissionDenied extends PermissionState {}

class PermissionRestricted extends PermissionState {}

class PermissionGranted extends PermissionState {}

class PermissionShowRationale extends PermissionState {}

class PermissionAppSettingsRequested extends PermissionState {}
