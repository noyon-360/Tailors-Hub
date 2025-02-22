import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailors_hub/config/route/package_path.dart';
import 'package:tailors_hub/config/route/routes_name.dart';
import 'package:tailors_hub/core/secure_key_content/secure_key.dart';
import 'package:tailors_hub/core/themes.dart';
import 'package:tailors_hub/presentation/bloc/Theme%20Management/them_cubit.dart';
import 'package:tailors_hub/presentation/bloc/Theme%20Management/them_state.dart';
import 'package:tailors_hub/presentation/bloc/auth_screen_switch/auth_switch_cubit.dart';
import 'package:tailors_hub/presentation/bloc/authentication/auth_bloc.dart';
import 'package:tailors_hub/presentation/bloc/splash_bloc/splash_screen_bloc.dart';
import 'package:tailors_hub/presentation/pages/account_selection_page.dart';

import 'package:tailors_hub/presentation/pages/home.dart';
import 'package:tailors_hub/presentation/pages/onboarding_screen.dart';
import 'package:tailors_hub/presentation/pages/splash_screen.dart';
import 'package:tailors_hub/repositories/authentication_repository.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final authenticationRepository = AuthenticationRepository();
  runApp(
    BlocProvider(
      create: (_) => ThemeCubit(),
      child: MyApp(authenticationRepository: authenticationRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.authenticationRepository});

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => SplashBloc()..add(SplashScreenEvent()),
        ),
        BlocProvider(lazy: false, create: (context) => AuthSwitchCubit()),
        BlocProvider(
          lazy: false,
          create: (context) => AuthenticationBloc(authenticationRepository),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          print("Main Page");
          final themeCubit = context.read<ThemeCubit>();

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Tailor Hub',
            theme: themeCubit.getThemeData(),

            // darkTheme: AppThemes.darkTheme,
            // themeMode: ThemeMode.system,

            // initialRoute: BlocBuilder<SplashBloc, SplashState>(
            //   buildWhen: (previous, current) => previous != current,
            //   builder: (context, state) {
            //     if (state is SplashComplete) {
            //       return RouteNames.authScreenController;
            //     } else if (state is OnboardingScreenComplete) {
            //       return RouteNames.onboarding;
            //     } else {
            //       return RouteNames.splashScreen;
            //     }
            //   },
            // ),
            // home: BlocBuilder<SplashBloc, SplashState>(
            //   buildWhen: (previous, current) => previous != current,
            //   builder: (context, state) {
            //     if (state is SplashComplete) {
            //       return AccountSelectionPage();
            //     } else if (state is OnboardingScreenComplete) {
            //       return OnboardingScreen();
            //     } else {
            //       return SplashScreen();
            //     }
            //   },
            // ),

            initialRoute: RouteNames.splashScreen,
            onGenerateRoute: Routes.generateRoutes,
          );
        },
      ),
    );
  }
}
