import 'package:flutter_application_test/domain/entities/purchase_history.dart';
import 'package:flutter_application_test/infrastructure/models/ticket_purchase_history.dart';

///Este mapper tiene como objetivo separar el servicio de la aplicacion, asi si hay
///alguna modificacion de uno de los parametros del servicio, como por ejemplo un
///cambio de nombre, no vaya a colapsar la aplicacion por ese cambio. Esta es una capa
///de proteccion del API que viene de afuera con la aplicacion.
class PurchaseHistoryMapper {
  static PurchaseHistory purchaseHistoryDBToEntity(
          TicketPurchaseHistory ticket) =>
      PurchaseHistory(
        adult: ticket.adult, 
        backdropPath: (ticket.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${ticket.backdropPath}'
        : 'https://upload.wikimedia.org/wikipedia/en/6/60/No_Picture.jpg',
        genreIds: ticket.genreIds.map((e) => e.toString()).toList(),
        id: ticket.id,
        originalLanguage: ticket.originalLanguage,
        originalTitle: ticket.originalTitle,
        overview: ticket.overview,
        popularity: ticket.popularity,
        posterPath: (ticket.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${ticket.posterPath}'
        : 'no-poster',
        releaseDate: ticket.releaseDate,
        title: ticket.title,
        video: ticket.video,
        voteAverage: ticket.voteAverage,
        voteCount: ticket.voteCount
      );
}
