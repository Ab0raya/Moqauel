import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/core/utils/fonts.dart';
import 'package:shoghl/features/home_feature/presentation/controller/filter_cubit.dart';
import 'package:shoghl/features/home_feature/presentation/home_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterCubit(),
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("fa", "IR"),
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: DarkMode.kPrimaryColor,
          brightness: Brightness.dark,
          fontFamily: Fonts.kCairoFont,
        ),
        home: const HomeView(),
      ),
    );
    // return ;
  }
}
