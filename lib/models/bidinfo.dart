// To parse this JSON data, do
//
//     final bids = bidsFromJson(jsonString);

import 'dart:convert';

Bids bidsFromJson(String str) => Bids.fromJson(json.decode(str));

String bidsToJson(Bids data) => json.encode(data.toJson());

class Bids {
  Bids({
    this.records,
  });

  List<Record> records;

  factory Bids.fromJson(Map<String, dynamic> json) => Bids(
        records:
            List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
      };
}

class Record {
  Record({
    this.bidid,
    this.auctionId,
    this.userid,
    this.amount,
    this.itemId,
    this.photos,
    this.itemname,
  });

  String bidid;
  String auctionId;
  String userid;
  String amount;
  String itemId;
  String photos;
  String itemname;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        bidid: json["Bidid"],
        auctionId: json["AuctionID"],
        userid: json["userid"],
        amount: json["Amount"],
        itemId: json["ItemID"],
        photos: json["photos"],
        itemname: json["itemname"],
      );

  Map<String, dynamic> toJson() => {
        "Bidid": bidid,
        "AuctionID": auctionId,
        "userid": userid,
        "Amount": amount,
        "ItemID": itemId,
        "photos": photos,
        "itemname": itemname,
      };
}
