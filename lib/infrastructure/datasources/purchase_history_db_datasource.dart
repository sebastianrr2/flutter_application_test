

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_application_test/domain/datasources/purchase_history_datasource.dart';
import 'package:flutter_application_test/domain/entities/purchase_history.dart';
import 'package:flutter_application_test/infrastructure/mappers/purchase_history_mapper.dart';
import 'package:flutter_application_test/infrastructure/models/purchase_history_response.dart';

class PurchaseHistoryDbDatasource extends PurchaseHistoryDatasource {
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': dotenv.env['THE_MOVIEDB_KEY'] ?? '',
      'language': 'en-US'
    }
  )
  );

  @override
  Future<List<PurchaseHistory>> getPurchaseHistory({int page = 1}) async {

    final response = await dio.get('/movie/now_playing');

    final purchaseHistoryResponse = PurchaseHistoryResponse.fromJson(response.data);

    ///El where permite filtrar la lista. Si se cumple la condicion se genera la lista.
    final List<PurchaseHistory> purcharseHistory = purchaseHistoryResponse.results
    .where((ticketPurchaseH) => ticketPurchaseH.posterPath != 'no-poster')
    .map(
      (ticketPurchaseH) => PurchaseHistoryMapper.purchaseHistoryDBToEntity(ticketPurchaseH)
    ).toList();

    return purcharseHistory;
  }


}