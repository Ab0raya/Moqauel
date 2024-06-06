import 'package:flutter/cupertino.dart';

extension Margin on num {
  SizedBox get sh => SizedBox(
    height: toDouble(),
  );
  SizedBox get sw => SizedBox(
    width: toDouble(),
  );
}