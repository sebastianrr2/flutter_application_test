

import 'package:flutter/material.dart';
import 'package:flutter_application_test/presentation/theme/app_theme.dart';

class CustomButtonStyle extends ButtonStyle {
  CustomButtonStyle({
    double? opacity = 1.0,
    BorderRadiusGeometry? borderRadius = const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
    Color? backgroundColor,
    Color? overlayColor,
    Color? borderColor
  }) : super(
    elevation: MaterialStateProperty.all(0),
    overlayColor: MaterialStateProperty.all(
      overlayColor ?? AppTheme.backgroundTrafficBlack.withOpacity(opacity!)),
    backgroundColor: MaterialStateProperty.all(
      backgroundColor ?? AppTheme.dullGold.withOpacity(1)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: borderRadius!
      ),
    ),
    side: MaterialStateProperty.all(
      BorderSide(
        color: borderColor ?? AppTheme.dullGold,
        width: 0.3,
        style: BorderStyle.solid
      )
    ),
  );
}