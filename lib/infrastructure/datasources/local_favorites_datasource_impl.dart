import 'package:flutter_application_test/domain/datasources/local_favorites_datasource.dart';
import 'package:flutter_application_test/domain/entities/movie.dart';
import 'package:flutter_application_test/shared/data/favorites_list.dart';

class LocalFavoritesDatasourceImpl extends FavoritesDatasource {
  List<Movie> favoritesList = favorites;

  @override
  bool isMovieFavorite(int movieId) {
    return favoritesList.any((movie) => movie.id == movieId);
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {

    /*Esta funcion es modificable para que con el id se puede hacer el toggle, 
    el codigo comentado es para llamar la funcion de busqueda 
    en la db*/

    bool isFavorite = isMovieFavorite(movie.id);

    if (isFavorite) {
      favoritesList.removeWhere((m) => m.id == movie.id);
    } else {
      //Movie? movie = await getMovie(movieId);
      //if (movie != null) {
        favoritesList.add(movie);
      //}
    }
  }

  @override
  Future<Movie?> getMovie(int movieId) async {
    // Simulando una búsqueda de detalles de película por su ID
    //En caso de que alla una db local se puede implementar esta funcion para que busque la pelicula por ID
    try {
      return favoritesList.firstWhere((movie) => movie.id == movieId);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> addMovieToList(Movie movie) async {
    if (!isMovieFavorite(movie.id)) {
      favoritesList.add(movie);
    }
  }
  
  @override
  List<Movie> getFavorites() {
    return favorites;
  }
}




