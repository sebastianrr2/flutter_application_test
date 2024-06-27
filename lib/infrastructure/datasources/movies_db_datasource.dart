

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_application_test/domain/datasources/movies_datasource.dart';
import 'package:flutter_application_test/domain/entities/movie.dart';
import 'package:flutter_application_test/infrastructure/mappers/movie_mapper.dart';
import 'package:flutter_application_test/infrastructure/models/movie_response.dart';

class MoviesDbDatasource extends MoviesDatasource {
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': dotenv.env['THE_MOVIEDB_KEY'] ?? '',
      'language': 'en-US'
    }
  )
  );

  @override
  Future<List<Movie>> getMovies({int page = 1}) async {

    final response = await dio.get('/movie/now_playing');

    final purchaseHistoryResponse = MovieResponse.fromJson(response.data);

    ///El where permite filtrar la lista. Si se cumple la condicion se genera la lista.
    final List<Movie> purcharseHistory = purchaseHistoryResponse.results
    .where((ticketPurchaseH) => ticketPurchaseH.posterPath != 'no-poster')
    .map(
      (ticketPurchaseH) => MovieMapper.movieDBToEntity(ticketPurchaseH)
    ).toList();

    return purcharseHistory;
  }


}