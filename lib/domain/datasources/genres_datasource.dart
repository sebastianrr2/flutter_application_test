

import 'package:flutter_application_test/infrastructure/models/genres_model.dart';

abstract class GenresDatasource {

  

  Genre getGenresById(String id);

  Future<List<Genre>> getGenres();

}