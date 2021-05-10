import 'package:auction_app/Pages/Homepage.dart';
import 'package:auction_app/Pages/ReisterPage.dart';
import 'package:auction_app/Services/api.dart';
import 'package:auction_app/Widgets/Button.dart';
import 'package:auction_app/Widgets/Header.dart';
import 'package:auction_app/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:auction_app/Services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final unamecontroller = TextEditingController();
  final passcontroller = TextEditingController();
  String mess = '';

  @override
  void dispose() {
    unamecontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HeaderContainer("Login"),
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 30, 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: unamecontroller,
                            decoration: InputDecoration(
                                labelText: 'User Name',
                                labelStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10),
                                prefixIcon: Icon(Icons.person)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Username cannot be empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: passcontroller,
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10),
                                prefixIcon: Icon(Icons.vpn_key)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password cannot be empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                child: Text(
                                  'Forget Password? ',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.cyan),
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                          ButtonWidget(
                            onClick: () async {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              var uname = unamecontroller.text;
                              var password = passcontroller.text;

                              Strings.user = uname;
                              var rsp = await loginUser(uname, password);
                              print(rsp);

                              Strings.userId = rsp['userid'];

                              if (rsp.containsKey('status')) {
                                setState(() {
                                  mess = rsp['message'];
                                });
                                if (rsp['status'] == 1) {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString('uname', uname);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext ctx) =>
                                              Homepage()));
                                }
                              } else {
                                setState(() {
                                  mess = 'Password or Username Wrong';
                                });
                              }
                            },
                            btnText: 'Login',
                          ),
                          Text(mess),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('New user?'),
                              FlatButton(
                                child: Text(
                                  'SignUP',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.cyan),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegPage()));
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
