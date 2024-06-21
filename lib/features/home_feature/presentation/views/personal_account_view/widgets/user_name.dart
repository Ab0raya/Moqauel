import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shoghl/core/utils/styles.dart';
import '../../../../../../generated/l10n.dart';


class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).userName,
      style: Styles.textStyle37,
    );
  }
}