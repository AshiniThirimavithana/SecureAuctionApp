// To parse this JSON data, do
//
//     final results = resultsFromJson(jsonString);

import 'dart:convert';

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));

String resultsToJson(Results data) => json.encode(data.toJson());

class Results {
  Results({
    this.records,
  });

  List<Record> records;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        records:
            List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
      };
}

class Record {
  Record({
    this.bidId,
    this.auctionId,
    this.userId,
    this.amount,
    this.itemId,
    this.itemName,
    this.photos,
  });

  String bidId;
  String auctionId;
  String userId;
  String amount;
  String itemId;
  String itemName;
  String photos;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        bidId: json["BidID"],
        auctionId: json["AuctionID"],
        userId: json["UserID"],
        amount: json["Amount"],
        itemId: json["ItemID"],
        itemName: json["ItemName"],
        photos: json["Photos"],
      );

  Map<String, dynamic> toJson() => {
        "BidID": bidId,
        "AuctionID": auctionId,
        "UserID": userId,
        "Amount": amount,
        "ItemID": itemId,
        "ItemName": itemName,
        "Photos": photos,
      };
}
