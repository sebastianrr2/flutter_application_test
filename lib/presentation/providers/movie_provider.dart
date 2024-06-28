part of 'providers.dart';

class MovieProvider extends ChangeNotifier {

  final MoviesRepository purchaseHistoryRepository;
  int currentPage = 0;
  List<Movie> ticketsList = [];

  MovieProvider({required this.purchaseHistoryRepository});

  Future<void> loadTicketsPurchaseHistory({bool reset = false}) async {
    currentPage++;

    final List<Movie> newListTickets = await purchaseHistoryRepository.getMovies(page: currentPage);

    ticketsList.addAll(newListTickets);

    notifyListeners();
  }

  List<Movie> getMovieList(){
    return ticketsList;
  }

}

