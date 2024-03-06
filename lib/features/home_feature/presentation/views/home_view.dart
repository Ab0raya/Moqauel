import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/features/home_feature/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import '../controller/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkMode.kBgColor,
      body: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        builder: (context, state) {
          final navCubit = BlocProvider.of<BottomNavigationBarCubit>(context);
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              navCubit.views[navCubit.currentIndex],
              const CustomBottomNavBar(),
            ],
          );
        },
      ),
    );
  }
}
