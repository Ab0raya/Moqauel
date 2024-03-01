import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/features/home_feature/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:shoghl/features/home_feature/presentation/widgets/home_view_body.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {

    return  const Scaffold(
      backgroundColor: DarkMode.kBgColor,
      body: HomeViewBody(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
