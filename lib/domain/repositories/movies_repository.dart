
import 'package:flutter_application_test/domain/entities/movie.dart';

abstract class MoviesRepository {

  Future<List<Movie>> getMovies({int page = 1});
  
}