
part of 'providers.dart';


class GenresProvider extends ChangeNotifier {

  final GenresRepository genresRepository;
  List<Genre> genreList= [];

  GenresProvider({required this.genresRepository});

  Future<void> loadGenreList() async {

    final List<Genre> newListGenres = await genresRepository.getGenres();

    genreList.addAll(newListGenres);

    notifyListeners();
  }

}