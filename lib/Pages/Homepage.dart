import 'package:auction_app/Pages/LoginPage.dart';
import 'package:auction_app/Pages/Myaccount.dart';
import 'package:auction_app/Pages/Mybids.dart';
import 'package:auction_app/Pages/Products.dart';
import 'package:auction_app/Widgets/HorizontalList.dart';
import 'package:flutter/material.dart';
import 'package:auction_app/constants/strings.dart';
import 'package:flutter_session/flutter_session.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
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
      drawer: new Drawer(
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(
              accountName: Text(Strings.user),
              currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              )),
              decoration: new BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Homepage()));
              },
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new myaccount()));
              },
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new mybids()));
              },
              child: ListTile(
                title: Text('My Bids'),
                leading: Icon(Icons.dashboard),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help),
              ),
            ),
            InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('uname');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext ctx) => LoginPage()));
              },
              child: ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.lock),
              ),
            )
          ],
        ),
      ),
      body: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.centerLeft, child: new Text("Categories")),
          ),
          HorizontalList(),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text("Recently Added")),
          ),
          Flexible(
            child: Products(),
          ),
        ],
      ),
    );
  }
}
