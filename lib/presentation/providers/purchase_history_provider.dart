part of 'providers.dart';

class PurchaseHistoryProvider extends ChangeNotifier {

  final PurchaseHistoryRepository purchaseHistoryRepository;
  int currentPage = 0;
  List<PurchaseHistory> ticketsList = [];

  PurchaseHistoryProvider({required this.purchaseHistoryRepository});

  Future<void> loadTicketsPurchaseHistory() async {
    currentPage++;

    final List<PurchaseHistory> newListTickets = await purchaseHistoryRepository.getPurchaseHistory(page: currentPage);

    ticketsList.addAll(newListTickets);

    notifyListeners();
  }

}