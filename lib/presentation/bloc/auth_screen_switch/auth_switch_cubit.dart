import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_switch_state.dart';

class AuthSwitchCubit extends Cubit<AuthSwitchState> {
  AuthSwitchCubit() : super(AuthSwitchState.register);

  void switchLoginScreen (bool userRole) => emit(AuthSwitchState.login);
  void switchRegisterScreen (bool userRole) => emit(AuthSwitchState.register);
}
