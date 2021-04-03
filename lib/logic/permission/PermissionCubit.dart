import 'package:bloc/bloc.dart';
import 'package:storycords/logic/permission/PermissionService.dart';
import 'package:storycords/logic/permission/PermissionState.dart';

class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(PermissionDenied());

  requestPermission(PermissionType type) async {
    emit(await PermissionService.ensurePermission(type));
  }

  /// Returns true if app settings were opened, false if not.
  Future<bool> openAppSettings() async {
    return await PermissionService.openAppSettingsForPermission();
  }
}
