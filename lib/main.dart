import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/core/utils/app_router.dart';
import 'package:shoghl/core/utils/controller/language_cubit/language_cubit.dart';
import 'package:shoghl/core/utils/controller/theme_cubit/theme_cubit.dart';
import 'package:shoghl/core/utils/controller/username_cubit/username_cubit.dart';
import 'package:shoghl/core/utils/fonts.dart';
import 'package:shoghl/features/archive_feature/presentation/controller/archive_cubit.dart';
import 'package:shoghl/features/home_feature/presentation/controller/add_account_cubit/add_account_cubit.dart';
import 'package:shoghl/features/home_feature/presentation/controller/filter_section_cubit/filter_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shoghl/features/home_feature/presentation/controller/switch_cubit/switch_cubit.dart';
import 'package:shoghl/features/laborers_feature/presentation/controller/attendance_cubit/attendance_cubit.dart';
import 'package:shoghl/features/laborers_feature/presentation/controller/laborer_cubit/laborer_cubit.dart';
import 'package:shoghl/features/onboarding_feature/presentation/controller/onboarding_cubit/onboarding_cubit.dart';

import 'core/utils/controller/language_cubit/language_state.dart';
import 'features/bottom_navigation_bar_feature/presentation/controller/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'features/home_feature/presentation/controller/treatment_cubit/treatment_cubit.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FilterCubit(),
        ),
        BlocProvider(
          create: (context) => BottomNavigationBarCubit(context),
        ),
        BlocProvider(
          create: (context) => AddAccountCubit(),
        ),
        BlocProvider(
          create: (context) => TreatmentCubit(),
        ),
        BlocProvider(
          create: (context) => SwitchCubit(),
        ),
        BlocProvider(
          create: (context) => AttendanceCubit(),
        ),
        BlocProvider(
          create: (context) => LaborerCubit(),
        ),
        BlocProvider(
          create: (context) => ArchiveCubit(),
        ), BlocProvider(
          create: (context) => OnboardingCubit(),
        ),BlocProvider(
          create: (context) => LanguageCubit(),
        ),BlocProvider(
          create: (context) => UsernameCubit(),
        ),BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<LanguageCubit,LanguageState >(
        builder: (context, state) {
          final cubit = BlocProvider.of<LanguageCubit>(context);
          return MaterialApp.router(
            locale:  Locale(cubit.language),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            //
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme:  AppBarTheme(
                  backgroundColor: DarkMode.kBgColor(context)),
              scaffoldBackgroundColor: DarkMode.kBgColor(context)
              ,useMaterial3: true,
              colorSchemeSeed: DarkMode.kPrimaryColor(context),
              brightness: Brightness.dark,
              fontFamily: Fonts.kCairoFont,
            ),
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
    // return ;
  }
}
