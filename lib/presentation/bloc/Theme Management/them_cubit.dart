import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tailors_hub/core/themes.dart';

import 'dart:ui' as ui;

import 'package:tailors_hub/presentation/bloc/Theme%20Management/them_state.dart';
import 'package:tailors_hub/services/theme_manager.dart'; // Import dart:ui for PlatformDispatcher

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(theme: AppTheme.light)) {
    _loadTheme();
  }

  // Load the saved theme from SharedPreferences
  Future<void> _loadTheme() async {
    final themeMode = await ThemeManager.loadThemeMode();
    switch (themeMode) {
      case ThemeMode.light:
        emit(const ThemeState(theme: AppTheme.light));
        break;
      case ThemeMode.dark:
        emit(const ThemeState(theme: AppTheme.dark));
        break;
      case ThemeMode.system:
        emit(const ThemeState(theme: AppTheme.system));
        break;
    }
  }

  // Switch to Light Theme
  void switchToLightTheme() async {
    emit(const ThemeState(theme: AppTheme.light));
    await ThemeManager.saveThemeMode(ThemeMode.light);
  }

  // Switch to Dark Theme
  void switchToDarkTheme() async {
    emit(const ThemeState(theme: AppTheme.dark));
    await ThemeManager.saveThemeMode(ThemeMode.dark);
  }

  // Switch to System Theme
  void switchToSystemTheme() async {
    emit(const ThemeState(theme: AppTheme.system));
    await ThemeManager.saveThemeMode(ThemeMode.system);
  }

  // Get the current theme data based on the state
  ThemeData getThemeData() {
    switch (state.theme) {
      case AppTheme.light:
        return AppThemes.lightTheme;
      case AppTheme.dark:
        return AppThemes.darkTheme;
      case AppTheme.system:
        final brightness = ui.PlatformDispatcher.instance.platformBrightness;
        return brightness == Brightness.dark ? AppThemes.darkTheme : AppThemes.lightTheme;
    }
  }
}