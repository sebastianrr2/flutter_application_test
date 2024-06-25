import 'package:flutter/material.dart';
import 'package:flutter_application_test/presentation/theme/app_theme.dart';
import 'package:flutter_application_test/presentation/theme/theme_styles.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';


class InputDecorations {

  final Color? fillColor;

  InputDecorations({Color? fillColor}) : fillColor = fillColor ?? AppTheme.battleshipGray.withOpacity(0.1);

  // Color fillColor = AppTheme.battleshipGray.withOpacity(0.1);

  InputDecoration inputDecoration({
    String? labelText,
    String? hintText,
    TextStyle? hintStyle = ThemeStyles.primaryTextFormField,
    TextStyle? labelStyle = ThemeStyles.primaryTextFormField,
    TextStyle? floatingLabelStyle = ThemeStyles.primaryTextFormFieldJosefin, 
    Widget? prefixIcon,
    BorderRadius? borderRadius = const BorderRadius.horizontal(right: Radius.circular(50), left: Radius.circular(50)),
    EdgeInsetsGeometry? contentPadding = const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    bool? flag = false,
    required BuildContext context,
  }) {

    final TextTheme textTheme = AppTheme.lightTheme.textTheme;

    final loginForm = Provider.of<FormProvider>(context);
    
    return InputDecoration(
      prefixIcon: prefixIcon,

      suffixIcon: flag == true ?
        InkWell(
          // customBorder: const ShapeBorder(),
          focusColor: AppTheme.backgroundTrafficBlack,
          hoverColor: AppTheme.backgroundTrafficBlack,
          highlightColor: AppTheme.backgroundTrafficBlack,
          splashColor: AppTheme.backgroundTrafficBlack,
          onTap: () {
            loginForm.visiblePassword = !loginForm.visiblePassword;
          },
          child: Icon(
            loginForm.visiblePassword ? Icons.visibility_off : Icons.visibility,
            color: AppTheme.lightGray,
          ),
        ) 
        : null,

      contentPadding: contentPadding,
      labelText: labelText,
      alignLabelWithHint: true,
      hintText: hintText,
      labelStyle: labelStyle,
      hintStyle: hintStyle,
      errorStyle: textTheme.titleSmall,
      floatingLabelStyle: floatingLabelStyle,
      counterStyle: textTheme.bodyLarge,
      
      enabledBorder: OutlineInputBorder(
        // borderSide: BorderSide(width: 0, color: AppTheme.battleshipGray.withOpacity(0.2)),
        borderSide: const BorderSide(width: 0, color: Colors.transparent),
        // borderRadius: BorderRadius.circular(50.0),
        borderRadius: borderRadius!
      ),
        
      focusedBorder: OutlineInputBorder(
        // borderSide: const BorderSide(width: 1, color: AppTheme.dullGold),
        borderSide: const BorderSide(width: 1, color: Colors.transparent),
        borderRadius: borderRadius,
      ),

      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.transparent),
        borderRadius: borderRadius,
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.transparent),
        borderRadius: borderRadius,
      ),

      fillColor: fillColor,
      filled: true,
    );
  }             
}