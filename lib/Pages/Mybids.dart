import 'package:auction_app/Pages/Bidproducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mybids extends StatefulWidget {
  @override
  _mybidsState createState() => _mybidsState();
}

class _mybidsState extends State<mybids> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.cyan,
        title: Text('My Bids'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: new bidproduct(),
    );
  }
}
