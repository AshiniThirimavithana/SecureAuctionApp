import 'package:auction_app/models/bidinfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:auction_app/Services/apiManager.dart';
import 'package:auction_app/models/bidinfo.dart';
import 'package:auction_app/constants/strings.dart';

class bidproduct extends StatefulWidget {
  @override
  _bidproductState createState() => _bidproductState();
}

class _bidproductState extends State<bidproduct> {
  Future<Bids> _bid;
  String userPhotos;
  String useritemname;
  String userbidamount;
  String biditemId;
  String biduserid;
  String userbidid;
  String bidauctionId;

  @override
  void initState() {
    _bid = ApiManager().getBids();
    print(_bid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<Bids>(
      future: _bid,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.records.length,
              itemBuilder: (context, index) {
                var article = snapshot.data.records[index];

                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Single_bid(
                    bidid: article.bidid,
                    auctionId: article.auctionId,
                    userid: article.userid,
                    amount: article.amount,
                    itemId: article.itemId,
                    photos: article.photos,
                    itemname: article.itemname,
                  ),
                );
              });
        } else
          return Center(child: CircularProgressIndicator());
      });
}

class Single_bid extends StatelessWidget {
  final bidid;
  final auctionId;
  final userid;
  final amount;
  final itemId;
  final photos;
  final itemname;

  Single_bid({
    this.bidid,
    this.auctionId,
    this.userid,
    this.amount,
    this.itemId,
    this.photos,
    this.itemname,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.network(photos, width: 80.0, height: 80.0),
        title: new Text(itemname),
        subtitle: new Column(
          children: <Widget>[
            new Container(
                alignment: Alignment.topLeft,
                child: new Text("\$${amount}",
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red))),
          ],
        ),
      ),
    );
  }
}
