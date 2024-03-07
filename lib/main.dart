import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/core/utils/fonts.dart';
import 'package:shoghl/features/home_feature/presentation/controller/add_account_cubit/add_account_cubit.dart';
import 'package:shoghl/features/home_feature/presentation/controller/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:shoghl/features/home_feature/presentation/controller/filter_section_cubit/filter_cubit.dart';
import 'package:shoghl/features/home_feature/presentation/views/home_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FilterCubit(),
        ),
        BlocProvider(
          create: (context) => BottomNavigationBarCubit(),
        ), BlocProvider(
          create: (context) => AddAccountCubit(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar", "EG"),
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
