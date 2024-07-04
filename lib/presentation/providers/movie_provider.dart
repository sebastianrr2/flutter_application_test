part of 'providers.dart';

class MovieProvider extends ChangeNotifier {
  final MoviesRepository purchaseHistoryRepository;  // Repositorio de películas
  int currentPage = 0;  // Página actual de la lista de películas
  List<Movie> ticketsList = [];  // Lista de películas
  bool isLoading = false;  // Indicador de estado de carga

  // Constructor que inicializa el proveedor con el repositorio de películas
  MovieProvider({required this.purchaseHistoryRepository});

  // Método asíncrono que carga el historial de compras de entradas
  Future<void> loadTicketsPurchaseHistory({bool reset = false}) async {
    if (reset) {
      currentPage = 0;  // Reinicia la página actual
      ticketsList = [];  // Limpia la lista de películas
    } else {
      currentPage++;  // Incrementa la página actual
    }

    isLoading = true;  // Establece el estado de carga
    notifyListeners();  // Notifica a los oyentes que ha habido un cambio

    final List<Movie> newListTickets = await purchaseHistoryRepository.getMovies(page: currentPage);  // Obtiene una lista de películas
    ticketsList.addAll(newListTickets);  // Agrega las nuevas películas a la lista existente

    isLoading = false;  // Restablece el estado de carga
    notifyListeners();  // Notifica a los oyentes que ha habido un cambio
  }

  // Método asíncrono que restablece la lista de películas
  Future<void> resetMovies() async {
    currentPage = 0;  // Reinicia la página actual
    ticketsList = [];  // Limpia la lista de películas
    await loadTicketsPurchaseHistory(reset: true);  // Carga de nuevo las películas con la lista reiniciada
  }

  // Método para obtener la lista de películas
  List<Movie> getMovieList() {
    return ticketsList;
  }

  // Getter para el estado de carga
  bool get loadingStatus => isLoading;
}




