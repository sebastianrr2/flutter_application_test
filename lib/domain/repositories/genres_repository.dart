

import 'package:flutter_application_test/infrastructure/models/genres_model.dart';

abstract class GenresRepository {

  Future<List<Genre>> getGenres();
  Future<List<Genre>> getGenresById(String id);
}