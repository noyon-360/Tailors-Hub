import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tailors_hub/presentation/bloc/auth_screen_switch/auth_switch_cubit.dart';
import 'package:tailors_hub/presentation/pages/auth/login_screen.dart';
import 'package:tailors_hub/presentation/pages/auth/register_screen.dart';

class AuthScreensController extends StatelessWidget {
  final bool isTailor;
  const AuthScreensController({super.key, required this.isTailor});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthSwitchCubit, AuthSwitchState>(builder: (context, state) {
      switch (state) {
        case AuthSwitchState.login:
          return LoginScreen(isTailor: isTailor,);
        case AuthSwitchState.register:
          return RegisterScreen(isTailor: isTailor,);
        }
    });
  }
}
