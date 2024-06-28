

import 'package:dio/dio.dart';
import 'package:flutter_application_test/domain/datasources/local_favorites_datasource.dart';
import 'package:flutter_application_test/domain/entities/movie.dart';
import 'package:flutter_application_test/shared/data/favorites_list.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocalFavoritesDatasourceImpl extends FavoritesDatasource{


  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': dotenv.env['THE_MOVIEDB_KEY'] ?? '',
      'language': 'en-US'
    }
  )
  );
  List<Movie> favoritesList = favorites;

  @override
  Future<bool> isMovieFavorite(int movieId) {
    // Verifica si la lista de favoritos no está vacía
    if (favoritesList.isNotEmpty) {
      // Busca si alguna película en la lista de favoritos tiene el ID proporcionado
      bool isFavorite = favoritesList.any((movie) => movie.id == movieId);
      return Future.value(isFavorite);
    } else {
      return Future.value(false); // Si la lista está vacía, retorna `false`
    }
  }


  @override
  Future<void> toggleFavorite(int movieId) {
    // TODO: implement toggleFavorite
    throw UnimplementedError();
  }
  
  @override
  Future<Movie> getMovie(int movieId) {
    // TODO: implement toggleFavorite
    throw UnimplementedError();
    


  }

  
}