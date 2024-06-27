import 'package:flutter_application_test/domain/entities/movie.dart';
import 'package:flutter_application_test/infrastructure/models/movie_entity.dart';

///Este mapper tiene como objetivo separar el servicio de la aplicacion, asi si hay
///alguna modificacion de uno de los parametros del servicio, como por ejemplo un
///cambio de nombre, no vaya a colapsar la aplicacion por ese cambio. Esta es una capa
///de proteccion del API que viene de afuera con la aplicacion.
class MovieMapper {
  static Movie movieDBToEntity(
          MovieEntity movie) =>
      Movie(
        adult: movie.adult, 
        backdropPath: (movie.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
        : 'https://upload.wikimedia.org/wikipedia/en/6/60/No_Picture.jpg',
        genreIds: movie.genreIds.map((e) => e.toString()).toList(),
        id: movie.id,
        originalLanguage: movie.originalLanguage,
        originalTitle: movie.originalTitle,
        overview: movie.overview,
        popularity: movie.popularity,
        posterPath: (movie.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
        : 'no-poster',
        releaseDate: movie.releaseDate,
        title: movie.title,
        video: movie.video,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount
      );
}
