import 'package:flutter/material.dart';

class Responsive {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double w(BuildContext context, double value) =>
      width(context) * value / 375;

  static double h(BuildContext context, double value) =>
      height(context) * value / 812;

  static double r(BuildContext context, double value) =>
      w(context, value);
}