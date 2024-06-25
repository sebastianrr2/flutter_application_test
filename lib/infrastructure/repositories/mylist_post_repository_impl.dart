

import 'package:flutter_application_test/domain/datasources/my_list_post_datasource.dart';
import 'package:flutter_application_test/domain/entities/my_list.dart';
import 'package:flutter_application_test/domain/repositories/my_list_post_repository.dart';

class MyListRepositoryImpl extends MyListPostRepository {

  final MyListPostDatasource myListDatasource;

  MyListRepositoryImpl({required this.myListDatasource});

  @override
  Future<List<MyList>> getMyList() {
    return myListDatasource.getMyList();
  }

}