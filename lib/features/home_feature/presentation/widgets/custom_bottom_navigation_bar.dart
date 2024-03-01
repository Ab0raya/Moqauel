import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/core/utils/styles.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0;
  List<Map<String, dynamic>> bottomNavBarData = [
    {
      'label': "الرئيسية",
      'icon': CupertinoIcons.home,
      'index': 0,
    },
    {
      'label': "الأفراد",
      'icon': CupertinoIcons.group_solid,
      'index': 3,
    },
    {
      'label': "فاتورة",
      'icon': CupertinoIcons.paperclip,
      'index': 12,
    },
    {
      'label': "حسابي",
      'icon': CupertinoIcons.person_alt_circle_fill,
      'index': 2,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
     //   borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          color: DarkMode.kBgColor,
          boxShadow: [
        BoxShadow(
          spreadRadius: 7,
          blurRadius: 20,
          offset: const Offset(0, 2),
          color: DarkMode.kPrimaryColor.withOpacity(0.2),
        )
      ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
                bottomNavBarData.length,
                (index) => Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              currentIndex = bottomNavBarData[index]['index'];
                            });
                          },
                          icon: Icon(
                            bottomNavBarData[index]['icon'],
                            color:
                                currentIndex == bottomNavBarData[index]['index']
                                    ? DarkMode.kPrimaryColor
                                    : Colors.white,
                            size: 33,
                          ),
                        ),
                        Visibility(
                            visible: currentIndex ==
                                bottomNavBarData[index]['index'],
                            child: Text(
                              bottomNavBarData[index]['label'],
                              style: Styles.headingTextStyle.copyWith(
                                color: currentIndex ==
                                    bottomNavBarData[index]['index']
                                    ? DarkMode.kPrimaryColor
                                    : Colors.white,
                              ),
                            )),
                      ],
                    )),
          ],
        ),
      ),
    );
  }
}
