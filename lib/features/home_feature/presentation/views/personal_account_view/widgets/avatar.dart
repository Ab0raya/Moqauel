import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: DarkMode.kPrimaryColor,
      radius: 60,
    );
  }
}
