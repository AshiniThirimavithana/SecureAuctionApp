import 'dart:async';

import 'package:auction_app/Pages/ItemBid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:auction_app/Services/apiManager.dart';
import 'package:auction_app/models/productinfo.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Future<Welcome> _item;

  @override
  void initState() {
    _item = ApiManager().getItems();
    print(_item);

    super.initState();

    setState(() {
      const oneSecond = const Duration(seconds: 25);
      new Timer.periodic(oneSecond, (Timer t) => setState(() {}));
    });
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<Welcome>(
      future: _item,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            itemCount: snapshot.data.records.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              var article = snapshot.data.records[index];
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Single_prod(
                  prod_id: article.id,
                  prod_name: article.name,
                  prod_picture: article.photos,
                  prod_Price: article.amount,
                  prod_des: article.description,
                  prod_cat: article.category,
                  prod_enddate: article.enddate,
                  prod_bidamount: article.bidamount,
                  prod_auctionid: article.auctionId,
                ),
              );
            },
          );
        } else
          return Center(child: CircularProgressIndicator());
      });
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_Price;
  final prod_des;
  final prod_id;
  final prod_cat;
  final prod_enddate;
  final prod_bidamount;
  final prod_auctionid;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_Price,
    this.prod_des,
    this.prod_id,
    this.prod_cat,
    this.prod_enddate,
    this.prod_bidamount,
    this.prod_auctionid,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
          child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ItemBidpage(
                        prod_detailname: prod_name,
                        prod_detailpicture: prod_picture,
                        prod_detailprice: prod_Price,
                        prod_detaildesc: prod_des,
                        prod_detailid: prod_id,
                        prod_detailcat: prod_cat,
                        prod_detailenddate: prod_enddate,
                        prod_detailbidamount: prod_bidamount,
                        prod_detailauctionid: prod_auctionid,
                      ))),
              child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      prod_name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    title: Text(
                      "\$$prod_bidamount",
                      style: TextStyle(
                          color: Colors.cyan, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "\$$prod_Price",
                      style: TextStyle(
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ),
                ),
                child: Image.network(
                  prod_picture,
                  fit: BoxFit.cover,
                ),
              )),
        ),
      ),
    );
  }
}
