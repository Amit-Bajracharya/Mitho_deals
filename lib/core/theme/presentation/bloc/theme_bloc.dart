import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/theme_repository.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository _repository;

  ThemeBloc({
    required ThemeRepository repository,
  })  : _repository = repository,
        super(const ThemeState.initial()) {
    on<ThemeEvent>(_onEvent);
  }

  Future<void> _onEvent(ThemeEvent event, Emitter<ThemeState> emit) async {
    await event.when(
      loadTheme: () async => _onLoadTheme(emit),
      updateTheme: (mode) async => _onUpdateTheme(mode, emit),
      toggleTheme: () async => _onToggleTheme(emit),
    );
  }

  Future<void> _onLoadTheme(Emitter<ThemeState> emit) async {
    try {
      final themeMode = await _repository.getThemeMode();
      emit(ThemeState.loaded(themeMode));
    } catch (e) {
      emit(ThemeState.loaded(ThemeMode.system));
    }
  }

  Future<void> _onUpdateTheme(ThemeMode mode, Emitter<ThemeState> emit) async {
    try {
      await _repository.setThemeMode(mode);
      emit(ThemeState.loaded(mode));
    } catch (e) {
      // Handle error silently or emit error state
    }
  }

  Future<void> _onToggleTheme(Emitter<ThemeState> emit) async {
    final currentMode = state.when(
      initial: () => ThemeMode.system,
      loaded: (mode) => mode,
    );

    final newMode = currentMode == ThemeMode.light 
        ? ThemeMode.dark 
        : ThemeMode.light;

    await _onUpdateTheme(newMode, emit);
  }
}
