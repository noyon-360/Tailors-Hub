import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tailors_hub/presentation/bloc/Theme%20Management/them_cubit.dart';
import 'package:tailors_hub/presentation/bloc/splash_bloc/splash_screen_bloc.dart';
import 'package:tailors_hub/presentation/pages/account_selection_page.dart';
import 'package:tailors_hub/presentation/pages/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        if (state is SplashComplete) {
          return AccountSelectionPage();
        } else if (state is OnboardingScreenComplete) {
          return OnboardingScreen();
        }
        return Scaffold(body: Center(child: Text("Splash Screen")));
      },
    );
  }
}
