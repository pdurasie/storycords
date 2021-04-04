import 'package:bloc/bloc.dart';
import 'package:storycords/logic/permission/PermissionService.dart';
import 'package:storycords/logic/permission/PermissionState.dart';

/// Let's keep this to reuse this later for different functionalities
/// that need Permissions.
class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(PermissionInitial());

  requestPermission(PermissionType type) async {
    emit(await PermissionService.ensurePermission(type));
  }

  /// Returns true if app settings were opened, false if not.
  Future<bool> openAppSettings() async {
    return await PermissionService.openAppSettingsForPermission();
  }
}
