import 'package:equatable/equatable.dart';

enum AppTheme { light, dark, system }

class ThemeState extends Equatable {
  final AppTheme theme;

  const ThemeState({required this.theme});

  @override
  List<Object> get props => [theme];
}