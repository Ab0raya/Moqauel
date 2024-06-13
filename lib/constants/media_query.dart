
import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;

}

double getScreenHeight(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

// double getScreenArea(BuildContext context) {
//   return (MediaQuery.of(context).size.height)*(MediaQuery.of(context).size.width);
// }
