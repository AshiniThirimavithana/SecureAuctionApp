import 'dart:async';
import 'package:auction_app/Pages/LoginPage.dart';
import 'package:flutter/material.dart';

class Splashpage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  SplashpageState createState() => SplashpageState();
}

class SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(microseconds: 6000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.cyan[600], Colors.cyan[600]],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter)),
          child: Center(child: Image.asset("assets/images/logo.png"))),
    );
  }
}
