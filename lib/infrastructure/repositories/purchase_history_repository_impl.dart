

import 'package:flutter_application_test/domain/datasources/purchase_history_datasource.dart';
import 'package:flutter_application_test/domain/entities/purchase_history.dart';
import 'package:flutter_application_test/domain/repositories/purchase_history_repository.dart';

class PurchaseHistoryRepositoryImpl extends PurchaseHistoryRepository {

  final PurchaseHistoryDatasource datasource;

  PurchaseHistoryRepositoryImpl(this.datasource);

  @override
  Future<List<PurchaseHistory>> getPurchaseHistory({int page = 1}) {
    return datasource.getPurchaseHistory(page: page);
  }



}