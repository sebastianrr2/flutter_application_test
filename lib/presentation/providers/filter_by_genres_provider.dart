
part of 'providers.dart';



// Proveedor que gestiona el filtrado de películas por género
class FilterMovieByGenreProvider with ChangeNotifier {
  final MoviesRepository purchaseHistoryRepository;  // Repositorio de películas
  List<Movie> filteredMoviesList = [];  // Lista de películas filtradas

  bool isFiltered = false;  // Indicador de si hay un filtro aplicado

  // Constructor que inicializa el proveedor con el repositorio de películas
  FilterMovieByGenreProvider(this.purchaseHistoryRepository);

  // Método asíncrono que filtra las películas por género
  Future<void> filterMoviesByGenres(int genreId) async {
    isFiltered = true;  // Establece que hay un filtro aplicado
    String genreIdString = genreId.toString();  // Convierte el ID del género a cadena
    final List<Movie> newListTickets = await purchaseHistoryRepository.getMovies(page: 1);  // Obtiene una lista de películas
    final List<Movie> filteredListTickets = newListTickets.where((movie) => movie.genreIds.contains(genreIdString)).toList();  // Filtra las películas por género

    filteredMoviesList = filteredListTickets;  // Actualiza la lista de películas filtradas
    notifyListeners();  // Notifica a los oyentes que ha habido un cambio
  }

  // Método asíncrono que limpia el filtro y restablece la lista completa de películas
  Future<void> clearFilter(BuildContext context) async {
    isFiltered = false;  // Establece que no hay un filtro aplicado
    filteredMoviesList = [];  // Limpia la lista de películas filtradas
    await context.read<MovieProvider>().resetMovies();  // Restablece la lista completa de películas usando el proveedor de películas
    notifyListeners();  // Notifica a los oyentes que ha habido un cambio
  }
}







