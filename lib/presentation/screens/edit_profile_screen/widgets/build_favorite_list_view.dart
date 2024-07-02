import 'package:flutter/material.dart';
import 'package:flutter_application_test/domain/entities/movie.dart';
import 'package:flutter_application_test/presentation/providers/local_favorites_provider.dart';
import 'package:flutter_application_test/presentation/screens/personal_screen/widgets/recomendations.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';

class BuildFavoriteListView extends StatelessWidget {
  const BuildFavoriteListView({super.key});

  @override
  Widget build(BuildContext context) {

    final favoritesProvider = context.read<FavoritesProvider>();

    final List<Movie> favoriteMovies = favoritesProvider.favoriteMovies;

    if (favoriteMovies.isEmpty) {
      return const Center(
        child: Text(
          'Not favorites yet',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
      itemCount: favoriteMovies.length,
      itemBuilder: ((context, index) {
        final movie = favoriteMovies[index];

        final date =
            "${movie.releaseDate.year.toString().padLeft(4, '0')}-${movie.releaseDate.month.toString().padLeft(2, '0')}-${movie.releaseDate.day.toString().padLeft(2, '0')}";

        return Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(movie.backdropPath),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken),
            ),
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.transparent,
                  height: 160,
                  width: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      movie.posterPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title.toUpperCase(),
                        style: ThemeStylesSettings.secondaryTitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '4441 Collins Ave, Miami Beach, FL 33140',
                        style: ThemeStylesSettings.primaryText,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        date,
                        style: ThemeStylesSettings.primaryText,
                      ),
                      const SizedBox(height: 5),
                      Recommendations(adult: movie.adult, popularity: movie.popularity),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}


