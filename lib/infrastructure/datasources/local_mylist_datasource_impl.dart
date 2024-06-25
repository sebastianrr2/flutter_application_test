
import 'package:flutter_application_test/domain/datasources/my_list_post_datasource.dart';
import 'package:flutter_application_test/domain/entities/my_list.dart';
import 'package:flutter_application_test/presentation/models/models.dart';
import 'package:flutter_application_test/shared/data/my_list_post.dart';

class LocalMyListDatasourceImpl extends MyListPostDatasource {

  @override
  Future<List<MyList>> getMyList() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<MyList> newList = myListPost.map(
      (video) => MyListModel.fromJsonMap(video).toMyListPostEntity()
    ).toList();

    return newList;
  }

}