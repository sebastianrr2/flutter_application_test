

part of 'providers.dart';

///El singleton se usa generalmente cuando se hace una peticion http
///asi se trae la informacion y se muestra. Se separa la logica de negocio de la
///aplicacion con el UI
class MyListProvider extends ChangeNotifier {

  final MyListPostRepository myListRepository;

  bool initialLoading = true;

  bool _isSelected = false;

  MyListProvider({required this.myListRepository});

  bool get isSelected => _isSelected;
  set isSelected(bool value) {
    _isSelected = value;
    notifyListeners();
  }

  List<MyList> mylist = [];

  List<bool> isChecked = [];

  // List<bool> get isChecked => _isChecked;

  void setChecked(bool value, int index) {
    isChecked[index] = value;
    notifyListeners();
  }

  void setAllCheckBox(bool value) {
    isChecked = List<bool>.filled(isChecked.length, value);
    notifyListeners();
  }

  Future<void> loadMyList() async {
    // await Future.delayed(const Duration(seconds: 2));

    // final List<MyList> newList = myListPost.map(
    //   (video) => MyListModel.fromJsonMap(video).toMyListPostEntity()
    // ).toList();

    final newList = await myListRepository.getMyList();

    isChecked = List<bool>.filled(newList.length, false);

    mylist.addAll(newList);
    initialLoading = false;
    notifyListeners();
  }

}