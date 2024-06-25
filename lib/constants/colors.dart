import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/utils/controller/theme_cubit/theme_cubit.dart';

class DarkMode {
  static Color kBgColor(BuildContext context) =>
      BlocProvider.of<ThemeCubit>(context).state.bgColor;
  static Color kPrimaryColor(BuildContext context) =>
      BlocProvider.of<ThemeCubit>(context).state.primaryColor;
  static Color kWhiteColor(BuildContext context) =>
      BlocProvider.of<ThemeCubit>(context).state.whiteColor;
}

