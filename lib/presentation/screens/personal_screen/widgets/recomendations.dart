import 'package:flutter/material.dart';
import 'package:flutter_application_test/presentation/theme/app_theme.dart';
import 'package:flutter_application_test/presentation/theme/theme.dart';

// Un widget sin estado para mostrar recomendaciones al usuario basado en las propiedades de la película
class Recommendations extends StatelessWidget {

  // Propiedades finales que indican si la película es para adultos y su popularidad
  final bool adult;
  final double popularity;

  // Constructor del widget que recibe las propiedades `adult` y `popularity`
  const Recommendations({super.key, required this.adult, required this.popularity});

  @override
  Widget build(BuildContext context) {
    // Widget para indicar si la película es para adultos
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
            '-18',
            style: ThemeStylesSettings.secondaryText,
          ),
        ),
      );
    } else {
      adultWidget = Container();
    }

    // Widget para indicar si la película es popular
    Widget popularityWidget;
    if (popularity > 2000) {
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
    } else {
      popularityWidget = Container();
    }

    // Devuelve un widget `Row` que contiene los widgets determinados anteriormente
    return Row(
      children: [
        adultWidget,
        const SizedBox(width: 5),
        popularityWidget,
      ],
    );
  }
}
