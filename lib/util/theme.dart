import 'package:riverpod/riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:system_theme/system_theme.dart';
import 'package:fluent_ui/fluent_ui.dart';

enum NavigationIndicators { sticky, end }


// Define un estado inmutable para mantener el estado de la aplicación
class AppThemeState {
  final AccentColor color;
  final ThemeMode mode;
  final PaneDisplayMode displayMode;
  final NavigationIndicators indicator;
  final WindowEffect windowEffect;
  final TextDirection textDirection;
  final Locale? locale;

  AppThemeState({
    required this.color,
    required this.mode,
    required this.displayMode,
    required this.indicator,
    required this.windowEffect,
    required this.textDirection,
    required this.locale,
  });

  // Método para copiar el estado actual con algunos cambios
  AppThemeState copyWith({
    AccentColor? color,
    ThemeMode? mode,
    PaneDisplayMode? displayMode,
    NavigationIndicators? indicator,
    WindowEffect? windowEffect,
    TextDirection? textDirection,
    Locale? locale,
  }) {
    return AppThemeState(
      color: color ?? this.color,
      mode: mode ?? this.mode,
      displayMode: displayMode ?? this.displayMode,
      indicator: indicator ?? this.indicator,
      windowEffect: windowEffect ?? this.windowEffect,
      textDirection: textDirection ?? this.textDirection,
      locale: locale ?? this.locale,
    );
  }
}

// Crear un Notifier que maneja el estado de la aplicación
class AppThemeNotifier extends StateNotifier<AppThemeState> {
  AppThemeNotifier()
      : super(AppThemeState(
    color: systemAccentColor,
    mode: ThemeMode.system,
    displayMode: PaneDisplayMode.auto,
    indicator: NavigationIndicators.sticky,
    windowEffect: WindowEffect.disabled,
    textDirection: TextDirection.ltr,
    locale: null,
  ));

  // Métodos para actualizar el estado
  void setColor(AccentColor color) {
    state = state.copyWith(color: color);
  }

  void setMode(ThemeMode mode) {
    state = state.copyWith(mode: mode);
  }

  void setDisplayMode(PaneDisplayMode displayMode) {
    state = state.copyWith(displayMode: displayMode);
  }

  void setIndicator(NavigationIndicators indicator) {
    state = state.copyWith(indicator: indicator);
  }

  void setWindowEffect(WindowEffect effect, BuildContext context) {
    Window.setEffect(
      effect: effect,
      color: [
        WindowEffect.solid,
        WindowEffect.acrylic,
      ].contains(effect)
          ? FluentTheme.of(context).micaBackgroundColor.withOpacity(0.05)
          : Colors.transparent,
      dark: FluentTheme.of(context).brightness.isDark,
    );
    state = state.copyWith(windowEffect: effect);
  }

  void setTextDirection(TextDirection direction) {
    state = state.copyWith(textDirection: direction);
  }

  void setLocale(Locale? locale) {
    state = state.copyWith(locale: locale);
  }
}

AccentColor get systemAccentColor {
  if ((defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.android) &&
      !kIsWeb) {
    return AccentColor.swatch({
      'darkest': SystemTheme.accentColor.darkest,
      'darker': SystemTheme.accentColor.darker,
      'dark': SystemTheme.accentColor.dark,
      'normal': SystemTheme.accentColor.accent,
      'light': SystemTheme.accentColor.light,
      'lighter': SystemTheme.accentColor.lighter,
      'lightest': SystemTheme.accentColor.lightest,
    });
  }
  return Colors.blue;
}
