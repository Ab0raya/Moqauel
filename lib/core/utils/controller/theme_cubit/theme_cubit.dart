import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void changePrimaryColor(Color color) {
    emit(state.copyWith(primaryColor: color));
  }

  void changeBgColor(Color color) {
    emit(state.copyWith(bgColor: color));
  }

  void changeWhiteColor(Color color) {
    emit(state.copyWith(whiteColor: color));
  }
}
