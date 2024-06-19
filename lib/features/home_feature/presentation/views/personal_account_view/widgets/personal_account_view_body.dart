import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/styles.dart';

class PersonalAccountViewBody extends StatelessWidget {
  const PersonalAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const CircleAvatar(
            backgroundColor: DarkMode.kPrimaryColor,
            radius: 60,
          ),
          const Text(
            'الحاج سيد',
            style: Styles.textStyle37,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 13),
            child: Row(
              children: [
                Text(
                  'الخصائص',
                  style: Styles.textStyle22.copyWith(
                    color: DarkMode.kPrimaryColor,
                  ),
                ),
                40.sh,
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            width: getScreenWidth(context) - 60,
            height: getScreenHeight(context) * 0.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: DarkMode.kWhiteColor.withOpacity(0.07),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: const Text(
                    'اللغة',
                    style: Styles.textStyle24,
                  ),
                  title: Row(
                    children: [
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: DarkMode.kPrimaryColor, width: 3),
                            shape: BoxShape.circle),
                        child: Image.asset(
                          'assets/images/egypt.png',
                          height: 35,
                          width: 35,
                        ),
                      ),
                      10.sw,
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: DarkMode.kPrimaryColor, width: 3),
                            shape: BoxShape.circle),
                        child: Image.asset(
                          'assets/images/united-kingdom.png',
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 30,
                  color: DarkMode.kPrimaryColor.withOpacity(0.6),
                  endIndent: 20,
                  indent: 20,
                ),
                ListTile(
                  leading: const Text(
                    'الثيم',
                    style: Styles.textStyle24,
                  ),
                  title: Row(
                    children: [
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 30,
                        height: 30,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: DarkMode.kPrimaryColor, width: 3),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 30,
                        height: 30,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: DarkMode.kPrimaryColor, width: 3),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Colors.yellow,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 30,
                        height: 30,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: DarkMode.kPrimaryColor, width: 3),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 30,
                        height: 30,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: DarkMode.kPrimaryColor, width: 3),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 13),
            child: Row(
              children: [
                Text(
                  'حسابي',
                  style: Styles.textStyle22.copyWith(
                    color: DarkMode.kPrimaryColor,
                  ),
                ),
                40.sh,
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            width: getScreenWidth(context) - 60,
            height: getScreenHeight(context) * 0.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: DarkMode.kWhiteColor.withOpacity(0.07),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                    leading: const Text(
                      'تغيير الأسم',
                      style: Styles.textStyle24,
                    ),
                    title: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.pen,
                              size: 30,
                            )),
                      ],
                    )),
                Divider(
                  height: 30,
                  color: DarkMode.kPrimaryColor.withOpacity(0.6),
                  endIndent: 20,
                  indent: 20,
                ),
                ListTile(
                    leading: const Text(
                      'تغيير الأفاتار',
                      style: Styles.textStyle24,
                    ),
                    title: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.photo_camera_solid,
                              size: 30,
                            )),
                      ],
                    )),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: getScreenWidth(context) * 0.3,
                height: 2,
                decoration: BoxDecoration(
                  color: DarkMode.kPrimaryColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'TheAburaya@',
                  style:
                      Styles.textStyle18.copyWith(color: DarkMode.kPrimaryColor),
                ),
              ),
              Container(
                width: getScreenWidth(context) * 0.3,
                height: 2,
                decoration: BoxDecoration(
                    color: DarkMode.kPrimaryColor.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12)
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
