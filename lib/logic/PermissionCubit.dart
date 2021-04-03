import 'package:bloc/bloc.dart';

enum PermissionState {
  Requesting,
  PermanentlyDenied,
  Denied,
  Restricted,
  Granted,
}

class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(PermissionState.Denied);
}
