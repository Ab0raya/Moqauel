import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';

class InfoContainer extends StatelessWidget {
  final List<Widget> children;

  const InfoContainer({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: getScreenWidth(context) - 60,
      height: getScreenHeight(context) * 0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: DarkMode.kWhiteColor.withOpacity(0.07),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
