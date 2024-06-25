
import 'package:flutter_application_test/domain/entities/my_list.dart';

abstract class MyListPostDatasource {

  Future<List<MyList>> getMyList();

}