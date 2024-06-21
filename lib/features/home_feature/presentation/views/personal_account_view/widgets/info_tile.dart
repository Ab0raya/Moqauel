import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shoghl/core/utils/styles.dart';

class InfoTile extends StatelessWidget {
  final String leadingText;
  final List<Widget> children;

  const InfoTile({Key? key, required this.leadingText, required this.children}) : super(key: key);

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
          ...children,
        ],
      ),
    );
  }
}