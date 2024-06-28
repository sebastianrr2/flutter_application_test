
import 'package:flutter_application_test/domain/entities/movie.dart';

abstract class FavoritesDatasource {

  Future<void> toggleFavorite(int movieId);

  Future<bool> isMovieFavorite(int movieId);

  Future<Movie> getMovie(int movieId);


}