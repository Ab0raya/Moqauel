import 'package:flutter/material.dart';
import 'package:shoghl/core/utils/styles.dart';

class AccountAction extends StatelessWidget {
  final String leadingText;
  final IconData icon;

  const AccountAction({Key? key, required this.leadingText, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        leadingText,
        style: Styles.textStyle24,
      ),
      title: Row(
        children: [
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}