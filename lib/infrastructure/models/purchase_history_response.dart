import 'dart:convert';

import 'package:flutter_application_test/infrastructure/models/ticket_purchase_history.dart';

class PurchaseHistoryResponse {
    final Dates? dates;
    final int page;
    final List<TicketPurchaseHistory> results;
    final int totalPages;
    final int totalResults;

    PurchaseHistoryResponse({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory PurchaseHistoryResponse.fromRawJson(String str) => PurchaseHistoryResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PurchaseHistoryResponse.fromJson(Map<String, dynamic> json) => PurchaseHistoryResponse(
        dates: json["dates"] != null ? Dates.fromJson(json["dates"]) : null,
        page: json["page"],
        results: List<TicketPurchaseHistory>.from(json["results"].map((x) => TicketPurchaseHistory.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        // "dates": dates == null ? null : dates!.toJson(),
        "dates": dates ?? dates!.toJson(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Dates {
    final DateTime maximum;
    final DateTime minimum;

    Dates({
        required this.maximum,
        required this.minimum,
    });

    factory Dates.fromRawJson(String str) => Dates.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toJson() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}
