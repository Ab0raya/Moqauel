import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer(
      {super.key,
        required this.height,
        required this.width,
        required this.child,  this.horizontalPadding, this.verticalPadding,} );

  final double height;
  final double width;
  final Widget child;
  final double? horizontalPadding ;
  final double? verticalPadding ;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 0,horizontal: horizontalPadding??0),
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: child,
        ),
      ),
    );
  }
}
