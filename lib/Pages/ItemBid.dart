import 'dart:ffi';

import 'package:auction_app/Pages/Homepage.dart';
import 'package:auction_app/Pages/Mybids.dart';
import 'package:auction_app/Pages/Products.dart';
import 'package:auction_app/Services/api.dart';
import 'package:auction_app/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

class ItemBidpage extends StatefulWidget {
  final prod_detailid;
  final prod_detailname;
  final prod_detailpicture;
  final prod_detaildesc;
  final prod_detailprice;
  final prod_detailcat;
  final prod_detailenddate;
  final prod_detailbidamount;
  final prod_detailauctionid;

  ItemBidpage(
      {this.prod_detailid,
      this.prod_detailname,
      this.prod_detailpicture,
      this.prod_detaildesc,
      this.prod_detailprice,
      this.prod_detailcat,
      this.prod_detailenddate,
      this.prod_detailbidamount,
      this.prod_detailauctionid});
// This widget is the root of your application.

  @override
  _ItemBidpageState createState() => _ItemBidpageState();
}

class _ItemBidpageState extends State<ItemBidpage> {
  final bidvalue = TextEditingController();
  String mess = "";
  GlobalKey<ScaffoldState> _key = GlobalKey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.cyan,
        title: Text('Auction App'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.network(widget.prod_detailpicture),
              ),
              footer: new Container(
                color: Colors.white,
                child: ListTile(
                  leading: new Text(
                    widget.prod_detailname,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text(
                        "${widget.prod_detailprice}",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      )),
                      Expanded(
                          child: new Text(
                        "${widget.prod_detailbidamount}",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: new Text(
                "End Date",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              )),
              Expanded(
                  child: new Text(
                "${widget.prod_detailenddate}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Enter Bid Value"),
                            content: SingleChildScrollView(
                                child: ListBody(
                              children: <Widget>[
                                new TextFormField(
                                    controller: bidvalue,
                                    decoration: InputDecoration(
                                      hintText: mess,
                                    )),
                                // Text(mess),
                              ],
                            )),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () async {
                                  var bamount = bidvalue.text;
                                  var aucid = widget.prod_detailauctionid;
                                  var uid = Strings.userId;
                                  var bidAmount = double.parse(bamount);
                                  var lastBidAmt =
                                      double.parse(widget.prod_detailbidamount);

                                  if (lastBidAmt > bidAmount) {
                                    // mess = "Enter Value";
                                    bidvalue.text = "";
                                    mess = "Pls enter valid bid val";
                                    // bidvalue.text = "Pls enter valid bid val";
                                    //
                                  } else {
                                    var rsp =
                                        await userbids(aucid, uid, bamount);
                                    print(rsp);
                                    if (rsp.containsKey('status')) {
                                      setState(() {
                                        mess = rsp['message'];
                                      });
                                      if (rsp['status'] == 1) {
                                        // Navigator.of(context).pop();
                                        // Navigator.pop(context);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Homepage()));
                                      }
                                    } else {
                                      setState(() {
                                        mess = 'Try Again';
                                      });
                                    }
                                    Text(mess);
                                  }
                                },
                                child: new Text("Bid"),
                              ),
                            ],
                          );
                        });
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: new Text("Bid"),
                ),
              ),
              FlatButton(
                child: Text(
                  'MY BIDS',
                  style: TextStyle(fontSize: 14, color: Colors.cyan),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => mybids()));
                },
              ),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text(widget.prod_detaildesc),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product name",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Text(widget.prod_detailname),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product Category",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Text(widget.prod_detailcat),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
