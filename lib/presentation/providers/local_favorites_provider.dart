import 'package:flutter/foundation.dart';
import 'package:flutter_application_test/domain/entities/movie.dart';
import 'package:flutter_application_test/domain/repositories/local_favorites_repository.dart';

class FavoritesProvider extends ChangeNotifier {
  final FavoritesRepository favoritesRepository;



  FavoritesProvider({required this.favoritesRepository});

  List<Movie> get favoriteMovies => favoritesRepository.getFavorites();

  Future<void> addFavorite(Movie movie) async {
    //await favoritesRepository.addMovieToList(movie);
    await favoritesRepository.toggleFavorite(movie);
    notifyListeners();
  }

  /*Future<void> removeFavorite(int movieId) async {
    await favoritesRepository.toggleFavorite(movieId);
    notifyListeners();
  }*/

  bool isFavorite(int movieId) {
    return favoritesRepository.isMovieFavorite(movieId);
  }
}




  

  
