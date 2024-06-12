import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoghl/constants/colors.dart';
import '../../../../../../core/utils/app_router.dart';

class AccountDetailsAppBar extends StatelessWidget {
  const AccountDetailsAppBar({super.key, required this.addIcon, required this.printIcon, required this.deleteIcon});
  final void Function() deleteIcon;
  final void Function() addIcon;
  final void Function() printIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed:deleteIcon,
          icon: const Icon(
            CupertinoIcons.delete,
            color: DarkMode.kPrimaryColor,
            size: 30,
          ),
        ),IconButton(
          onPressed:addIcon,
          icon: const Icon(
            CupertinoIcons.add_circled,
            color: DarkMode.kPrimaryColor,
            size: 30,
          ),
        ),
        IconButton(
          onPressed:printIcon,
          icon: const Icon(
            CupertinoIcons.printer,
            color: DarkMode.kPrimaryColor,
            size: 30,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            context.go(AppRouter.homeViewPath);
          },
          icon: const Icon(
            CupertinoIcons.forward,
            size: 30,
          ),
        ),
      ],
    );
  }
}
