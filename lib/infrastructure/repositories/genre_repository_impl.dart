

import 'package:flutter_application_test/domain/datasources/genres_datasource.dart';
import 'package:flutter_application_test/domain/repositories/genres_repository.dart';
import 'package:flutter_application_test/infrastructure/models/genres_model.dart';

class GenreRepositoryImpl extends GenresRepository{

  final GenresDatasource datasource;
  GenreRepositoryImpl(this.datasource);

  @override
  Future<List<Genre>> getGenres() {
    return datasource.getGenres();
  }

  @override
  Future<List<Genre>> getGenresById(String id) {
    // TODO: implement getGenresById
    throw UnimplementedError();
  }

  
}