import 'package:flutter/material.dart';
import 'package:flutter_application_test/domain/entities/movie.dart';
import 'package:flutter_application_test/presentation/providers/local_favorites_provider.dart';
import 'package:flutter_application_test/presentation/screens/personal_screen/widgets/recomendations.dart';
import 'package:flutter_application_test/presentation/theme/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';
import '../../../theme/theme.dart';

class BuildMovieListView extends StatelessWidget {
  const BuildMovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<MovieProvider, FilterMovieByGenreProvider, FavoritesProvider>(
      builder: (context, movieProvider, filterMovieGenreProvider, favoritesProvider, child) {
        if (movieProvider.loadingStatus) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppTheme.dullGold,
            )
          );
        }

        final List<Movie> moviesToShow = filterMovieGenreProvider.isFiltered
            ? filterMovieGenreProvider.filteredMoviesList
            : movieProvider.ticketsList;

        if (moviesToShow.isEmpty) {
          return const Center(
            child: Text(
              'No movies found',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        }

        return ListView.builder(
          physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
          itemCount: moviesToShow.length,
          itemBuilder: (context, index) {
            Movie movieInfo = moviesToShow[index];

            final date =
                "${movieInfo.releaseDate.year.toString().padLeft(4, '0')}-${movieInfo.releaseDate.month.toString().padLeft(2, '0')}-${movieInfo.releaseDate.day.toString().padLeft(2, '0')}";

            bool isFavorite = favoritesProvider.isFavorite(movieInfo.id);

            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movieInfo.backdropPath),
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
                              movieInfo.posterPath,
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
                                movieInfo.title.toUpperCase(),
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
                              Recommendations(adult: movieInfo.adult, popularity: movieInfo.popularity)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: IconButton(
                    onPressed: () {
                      if (isFavorite) {
                        favoritesProvider.removeFavorite(movieInfo);
                      } else {
                        favoritesProvider.addFavorite(movieInfo);
                      }
                    },
                    icon: Icon(
                      isFavorite ? Icons.star : Icons.star_border,
                      color: isFavorite ? AppTheme.dullGold : AppTheme.dullGold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
