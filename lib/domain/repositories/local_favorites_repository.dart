
import 'package:flutter_application_test/domain/entities/movie.dart';

abstract class FavoritesRepository {

  Future<void> toggleFavorite(Movie movie);

  bool isMovieFavorite(int movieId);

  Future<Movie?> getMovie(int movieId);

  Future<void> addMovieToList( Movie movie);

  List<Movie> getFavorites();

}