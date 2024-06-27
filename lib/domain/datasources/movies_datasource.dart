
import 'package:flutter_application_test/domain/entities/movie.dart';

abstract class MoviesDatasource {

  Future<List<Movie>> getMovies({int page = 1});
  
}