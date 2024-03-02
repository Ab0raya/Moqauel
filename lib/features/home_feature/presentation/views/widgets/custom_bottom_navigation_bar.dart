import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/core/utils/styles.dart';
import 'package:shoghl/features/home_feature/presentation/controller/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      width: getScreenWidth(context) * 0.75,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: DarkMode.kBgColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 20,
            offset: const Offset(0, 2),
            color: DarkMode.kPrimaryColor.withOpacity(0.2),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0),
        child:BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
          builder: (context, state) {
            final navCubit = BlocProvider.of<BottomNavigationBarCubit>(context);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                    navCubit.bottomNavBarData.length,
                        (index) =>
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                navCubit.changeItem(index);
                                // currentIndex =
                                // bottomNavBarData[index]['index'];

                              },
                              icon: Icon(
                                navCubit.bottomNavBarData[index]['icon'],
                                color:
                                navCubit.currentIndex ==
                                    navCubit.bottomNavBarData[index]['index']
                                    ? DarkMode.kPrimaryColor
                                    : Colors.white,
                                size: 33,
                              ),
                            ),
                            Visibility(
                                visible: navCubit.currentIndex ==
                                    navCubit.bottomNavBarData[index]['index'],
                                child: Text(
                                  navCubit.bottomNavBarData[index]['label'],
                                  style: Styles.headingTextStyle.copyWith(
                                    color: navCubit.currentIndex ==
                                        navCubit
                                            .bottomNavBarData[index]['index']
                                        ? DarkMode.kPrimaryColor
                                        : Colors.white,
                                  ),
                                )),
                          ],
                        )),
              ],
            );
          },
        ),
      ),
    );
  }
}
