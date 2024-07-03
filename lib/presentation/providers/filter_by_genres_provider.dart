
part of 'providers.dart';


class FilterMovieByGenreProvider with ChangeNotifier {
  final MoviesRepository purchaseHistoryRepository;
  List<Movie> filteredMoviesList = [];

  bool isFiltered = false;

  FilterMovieByGenreProvider(this.purchaseHistoryRepository);

  Future<void> filterMoviesByGenres(int genreId) async {
    isFiltered = true;
    String genreIdString = genreId.toString();
    final List<Movie> newListTickets = await purchaseHistoryRepository.getMovies(page: 1);
    final List<Movie> filteredListTickets = newListTickets.where((movie) => movie.genreIds.contains(genreIdString)).toList();

    filteredMoviesList = filteredListTickets;
    notifyListeners();
  }

  Future<void> clearFilter(BuildContext context) async {
    isFiltered = false;
    filteredMoviesList = [];
    await context.read<MovieProvider>().resetMovies();
    notifyListeners();
  }
}






