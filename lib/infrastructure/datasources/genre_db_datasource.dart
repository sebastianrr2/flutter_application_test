import 'package:dio/dio.dart';
import 'package:flutter_application_test/domain/datasources/genres_datasource.dart';
import 'package:flutter_application_test/infrastructure/mappers/genres_mapper.dart';
import 'package:flutter_application_test/infrastructure/models/genres_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GenreDbDatasource extends GenresDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': dotenv.env['THE_MOVIEDB_KEY'] ?? '',
      'language': 'en-US'
    }
  )
  );
  @override
  Future<List<Genre>> getGenres() async {


    final response = await dio.get('/genre/movie/list');

    final genresResponse = GenreResponse.fromJson(response.data);

    ///El where permite filtrar la lista. Si se cumple la condicion se genera la lista.
    final List<Genre> genres = genresResponse.genres.map(
      (genre) => GenreMapper.genresToEntity(genre)
    ).toList();

    return genres;
  }
  
  @override
  Genre getGenresById(String id) {
    // TODO: implement getGenresById
    throw UnimplementedError();
  }
}