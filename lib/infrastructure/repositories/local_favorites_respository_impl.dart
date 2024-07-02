

import 'package:flutter_application_test/domain/datasources/local_favorites_datasource.dart';
import 'package:flutter_application_test/domain/entities/movie.dart';
import 'package:flutter_application_test/domain/repositories/local_favorites_repository.dart';

class FavoritesRepositoryImpl extends FavoritesRepository {


  final FavoritesDatasource datasource;

  FavoritesRepositoryImpl({required this.datasource});
  @override
  bool isMovieFavorite(int movieId) {
    
    return datasource.isMovieFavorite(movieId);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return datasource.toggleFavorite(movie);
  }
  
  @override
  Future<Movie?> getMovie(int movieId) {
    return datasource.getMovie(movieId);
  }
  
  @override
  Future<void> addMovieToList(Movie movie) {
    return datasource.addMovieToList(movie);
  }
  
  @override
  List<Movie> getFavorites() {
    return datasource.getFavorites();
  }


  

  
}