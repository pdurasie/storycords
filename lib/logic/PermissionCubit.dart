import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

/*
enum PermissionState {
  RequestInProgress,
  PermanentlyDenied,
  Denied,
  Restricted,
  Granted,
}

 */

abstract class PermissionState {

}

@injectable
class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(PermissionState.Denied);

  void setRequesting() => 
}
