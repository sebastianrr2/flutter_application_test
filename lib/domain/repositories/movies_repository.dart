
import 'package:flutter_application_test/domain/entities/movie.dart';

abstract class MoviesRepository {

  Future<List<Movie>> getMovies({int page = 1});

  Future<List<Movie>> getMoviesFilterByGenre(int genreId);
  
}