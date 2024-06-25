import 'package:flutter/material.dart';
import 'package:flutter_application_test/presentation/theme/app_theme.dart';
import 'package:flutter_application_test/presentation/theme/theme.dart';

class Recommendations extends StatelessWidget {


  final bool adult;
  final double popularity;

  const Recommendations({super.key, required this.adult, required this.popularity});

  @override
  Widget build(BuildContext context) {
    // Determine which widget to display based on the conditions
    Widget adultWidget;
    if (adult == false) {
      adultWidget = Container(
        height: 20,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppTheme.plus18softViolet,
        ),
        child: Center(
          child: Text(
            '18+',
            style: ThemeStylesSettings.secondaryText,
          ),
        ),
      );
    }
    else {
      adultWidget = Container();
    }

    Widget popularityWidget;
    if (popularity > 4000) {
      popularityWidget = Container(
        height: 20,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppTheme.trendingWeeblyOrange,
        ),
        child: Center(
          child: Text(
            'Popular',
            style: ThemeStylesSettings.secondaryText,
          ),
        ),
      );
    }
    else {
      popularityWidget = Container();
    }
    // Return the Row widget with the determined content
    return Row(
      children: [
        adultWidget,
        const SizedBox(width: 5),
        popularityWidget],
    );
  }
}