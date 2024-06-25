
import 'package:flutter_application_test/infrastructure/models/genres_model.dart';

class GenreMapper {

  static Genre genresToEntity(Genre genre) => 
  Genre(
      id: genre.id,
      name: genre.name,
    );
    
}