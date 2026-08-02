import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

@freezed
class ThemeState with _$ThemeState {
  const ThemeState._();
  
  const factory ThemeState.initial() = _Initial;
  const factory ThemeState.loaded(ThemeMode themeMode) = _Loaded;
  
  bool get isLightMode {
    return when(
      initial: () => true,
      loaded: (mode) {
        if (mode == ThemeMode.system) {
          // This will be determined by MediaQuery in the UI
          return true;
        }
        return mode == ThemeMode.light;
      },
    );
  }
}
