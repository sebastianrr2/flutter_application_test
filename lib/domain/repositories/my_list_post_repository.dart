
import 'package:flutter_application_test/domain/entities/my_list.dart';

///Los repositorios acceden al datasource para traer la informacion a la aplicacion
abstract class MyListPostRepository {

  Future<List<MyList>> getMyList();

}