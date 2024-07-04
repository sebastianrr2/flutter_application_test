import 'package:flutter/foundation.dart';
import 'package:flutter_application_test/domain/entities/movie.dart';
import 'package:flutter_application_test/domain/repositories/local_favorites_repository.dart';

// Proveedor para gestionar las películas favoritas
class FavoritesProvider extends ChangeNotifier {
  final FavoritesRepository favoritesRepository;  // Repositorio de favoritos

  // Constructor que inicializa el proveedor con el repositorio de favoritos
  FavoritesProvider({required this.favoritesRepository});

  // Getter para obtener la lista de películas favoritas
  List<Movie> get favoriteMovies => favoritesRepository.getFavorites();

  // Método asíncrono para agregar una película a la lista de favoritos
  Future<void> addFavorite(Movie movie) async {
    // await favoritesRepository.addMovieToList(movie);
    await favoritesRepository.toggleFavorite(movie);  // Alterna el estado de favorito de la película
    notifyListeners();  // Notifica a los oyentes que ha habido un cambio
  }

  // Método asíncrono para eliminar una película de la lista de favoritos
  Future<void> removeFavorite(Movie movie) async {
    await favoritesRepository.toggleFavorite(movie);  // Alterna el estado de favorito de la película
    notifyListeners();  // Notifica a los oyentes que ha habido un cambio
  }

  // Método para verificar si una película es favorita
  bool isFavorite(int movieId) {
    return favoritesRepository.isMovieFavorite(movieId);
  }
}





  

  
