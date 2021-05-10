// ignore: avoid_web_libraries_in_flutter
import 'package:auction_app/Pages/Homepage.dart';
import 'package:auction_app/Pages/Splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auction_app/Pages/test.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:auction_app/Pages/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var uname = prefs.getString('uname');
  print(uname);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: uname == '' ? Homepage() : Splashpage(),
  ));
}

//
