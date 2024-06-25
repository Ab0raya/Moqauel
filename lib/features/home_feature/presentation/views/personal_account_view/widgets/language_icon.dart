import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';

class LanguageIcon extends StatelessWidget {
  final String asset;
  final bool selected;
  final Function() onTap;

  const LanguageIcon({Key? key, required this.asset, required this.selected, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      highlightColor: DarkMode.kPrimaryColor(context).withOpacity(0.4),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: selected ? Border.all(color: DarkMode.kPrimaryColor(context), width: 3) : null,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          asset,
          height: 35,
          width: 35,
        ),
      ),
    );
  }
}
