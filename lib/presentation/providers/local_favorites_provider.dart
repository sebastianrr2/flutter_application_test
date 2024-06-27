import 'package:flutter/material.dart';
import 'package:flutter_application_test/domain/repositories/local_favorites_repository.dart';

class FavoritesRepositoryProvider with ChangeNotifier {
  final FavoritesRepository favoritesRepository;

  FavoritesRepositoryProvider({required this.favoritesRepository});


  /*FavoritesRepositoryProvider(FavoritesDatasource datasource)
        : _favoritesRepository = FavoritesRepositoryImpl(datasource: datasource);

  FavoritesRepositoryImpl get repository => _favoritesRepository;*/
}
  

  
