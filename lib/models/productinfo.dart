// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.records,
  });

  List<Record> records;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        records:
            List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
      };
}

class Record {
  Record({
    this.id,
    this.name,
    this.description,
    this.category,
    this.photos,
    this.amount,
    this.bidamount,
    this.auctionId,
    this.enddate,
  });

  String id;
  String name;
  String description;
  String category;
  String photos;
  String amount;
  String bidamount;
  String auctionId;
  DateTime enddate;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        photos: json["photos"],
        amount: json["amount"],
        bidamount: json["bidamount"],
        auctionId: json["AuctionID"],
        enddate: DateTime.parse(json["Enddate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category": category,
        "photos": photos,
        "amount": amount,
        "bidamount": bidamount,
        "AuctionID": auctionId,
        "Enddate":
            "${enddate.year.toString().padLeft(4, '0')}-${enddate.month.toString().padLeft(2, '0')}-${enddate.day.toString().padLeft(2, '0')}",
      };
}
