
import 'package:flutter_application_test/domain/entities/movie.dart';

abstract class FavoritesDatasource {

  Future<void> toggleFavorite(Movie purchaseHistory);

  Future<bool> isMovieFavorite(int movieId);

  Future<List<Movie>> loadMovies();


}