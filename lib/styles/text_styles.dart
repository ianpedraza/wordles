import 'package:flutter/material.dart';
import 'package:wordles/values/colors.dart';

class TextStyles {
  static const double fontSize8 = 8.0;
  static const double fontSize10 = 10.0;
  static const double fontSize12 = 12.0;
  static const double fontSize14 = 14.0;
  static const double fontSize16 = 16.0;
  static const double fontSize18 = 18.0;
  static const double fontSize20 = 20.0;
  static const double fontSize22 = 22.0;
  static const double fontSize24 = 24.0;
  static const double fontSize26 = 26.0;
  static const double fontSize28 = 26.0;
  static const double fontSize32 = 32.0;
  static const double fontSize34 = 34.0;
  static const double fontSize36 = 36.0;

  final BuildContext context;

  TextStyles(this.context);

  TextStyle get baseRegular12Text =>
      TextStyle(color: Theme.of(context).textTheme.bodyText1?.color, fontSize: fontSize12, fontWeight: FontWeight.w500);

  TextStyle get baseRegular14Text =>
      TextStyle(color: Theme.of(context).textTheme.bodyText1?.color, fontSize: fontSize14, fontWeight: FontWeight.w500);

  TextStyle get baseRegular16Text =>
      TextStyle(color: Theme.of(context).textTheme.bodyText1?.color, fontSize: fontSize16, fontWeight: FontWeight.w500);

  TextStyle get baseRegular18Text =>
      TextStyle(color: Theme.of(context).textTheme.bodyText1?.color, fontSize: fontSize18, fontWeight: FontWeight.w500);

  TextStyle get baseBold24Text =>
      TextStyle(color: Theme.of(context).textTheme.bodyText1?.color, fontSize: fontSize24, fontWeight: FontWeight.bold);

  TextStyle get baseBold16Text =>
      TextStyle(color: Theme.of(context).textTheme.bodyText1?.color, fontSize: fontSize16, fontWeight: FontWeight.bold);

  TextStyle get baseBold18Text =>
      TextStyle(color: Theme.of(context).textTheme.bodyText1?.color, fontSize: fontSize18, fontWeight: FontWeight.bold);

  TextStyle get baseBold32Text =>
      TextStyle(color: Theme.of(context).textTheme.bodyText1?.color, fontSize: fontSize32, fontWeight: FontWeight.bold);

  TextStyle get keyboardRegular16Text =>
      const TextStyle(color: darkColor, fontSize: fontSize16, fontWeight: FontWeight.w600);

  TextStyle get boardRegular32Text =>
      TextStyle(color: Theme.of(context).textTheme.bodyText1?.color, fontSize: fontSize32, fontWeight: FontWeight.w600);
}
