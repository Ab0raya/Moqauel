import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';

class LanguageIcon extends StatelessWidget {
  final String asset;

  const LanguageIcon({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(color: DarkMode.kPrimaryColor, width: 3),
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        asset,
        height: 35,
        width: 35,
      ),
    );
  }
}