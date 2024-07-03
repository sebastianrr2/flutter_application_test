part of 'providers.dart';

class MovieProvider extends ChangeNotifier {
  final MoviesRepository purchaseHistoryRepository;
  int currentPage = 0;
  List<Movie> ticketsList = [];
  bool isLoading = false;

  MovieProvider({required this.purchaseHistoryRepository});

  Future<void> loadTicketsPurchaseHistory({bool reset = false}) async {
    if (reset) {
      currentPage = 0;
      ticketsList = [];
    } else {
      currentPage++;
    }

    isLoading = true;
    notifyListeners();

    final List<Movie> newListTickets = await purchaseHistoryRepository.getMovies(page: currentPage);
    ticketsList.addAll(newListTickets);

    isLoading = false;
    notifyListeners();
  }

  Future<void> resetMovies() async {
    currentPage = 0;
    ticketsList = [];
    await loadTicketsPurchaseHistory(reset: true);
  }

  List<Movie> getMovieList() {
    return ticketsList;
  }

  bool get loadingStatus => isLoading;
}




