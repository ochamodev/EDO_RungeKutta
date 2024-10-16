import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runge_kutta_app/util/theme.dart';

final appThemeProvider = StateNotifierProvider<AppThemeNotifier, AppThemeState>((ref) {
  return AppThemeNotifier();
});