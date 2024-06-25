
import 'package:flutter_application_test/domain/entities/purchase_history.dart';

abstract class PurchaseHistoryDatasource {

  Future<List<PurchaseHistory>> getPurchaseHistory({int page = 1});
  
}