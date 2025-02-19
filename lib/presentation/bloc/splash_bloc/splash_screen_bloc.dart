import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailors_hub/core/secure_key_content/secure_key.dart';

part 'splash_screen_event.dart';

part 'splash_screen_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashScreenEvent>((event, emit) async {
      await Future.delayed(Duration(seconds: 2));
      SharedPreferences preferences = await SharedPreferences.getInstance();
      bool isFirstTime = preferences.getBool(SecureKey.isFirstTimeKey) ?? true;

      if (isFirstTime) {
        emit(OnboardingScreenComplete());
      } else {
        emit(SplashComplete());
      }
    });
  }

  // Stream<SplashState> mapEventToState(SplashEvent event) async* {
  //   if (event is CheckThemeEvent) {
  //     // Simulate a delay for the splash screen
  //     await Future.delayed(Duration(seconds: 2));
  //
  //     // Check the theme mode or any other initial setup
  //     // For example, you can check the theme mode here
  //     // bool isDarkMode = await _checkThemeMode();
  //
  //     // After the splash screen is complete, emit the SplashComplete state
  //     yield SplashComplete();
  //   }
  // }
}
