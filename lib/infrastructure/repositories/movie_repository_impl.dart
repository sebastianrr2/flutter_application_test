

import 'package:flutter_application_test/domain/datasources/movies_datasource.dart';
import 'package:flutter_application_test/domain/entities/movie.dart';
import 'package:flutter_application_test/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {

  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getMovies({int page = 1}) {
    return datasource.getMovies(page: page);
  }



}