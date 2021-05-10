import 'package:auction_app/Pages/LoginPage.dart';
import 'package:auction_app/Services/api.dart';
import 'package:auction_app/Widgets/Button.dart';
import 'package:auction_app/Widgets/Header.dart';
import 'package:auction_app/constants/strings.dart';
import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  RegPageState createState() => RegPageState();
}

class RegPageState extends State<RegPage> {
  final _formKey = GlobalKey<FormState>();
  final cname = TextEditingController();
  final cuname = TextEditingController();
  final cnic = TextEditingController();
  final caddress = TextEditingController();
  final cemail = TextEditingController();
  final ctelno = TextEditingController();
  final cpassword = TextEditingController();
  final crpass = TextEditingController();
  String mess = '';

  @override
  void clearText() {
    cname.clear();
    cuname.clear();
    cnic.clear();
    caddress.clear();
    cemail.clear();
    ctelno.clear();
    cpassword.clear();
    crpass.clear();
  }

  @override
  void dispose() {
    cname.dispose();
    cuname.dispose();
    cnic.dispose();
    caddress.dispose();
    cemail.dispose();
    ctelno.dispose();
    cpassword.dispose();
    crpass.dispose();
    super.dispose();
  }

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HeaderContainer("Register"),
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
                            controller: cname,
                            decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10),
                                prefixIcon: Icon(Icons.person_outline)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Name is required';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: cuname,
                            decoration: InputDecoration(
                                labelText: 'User Name',
                                labelStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10),
                                prefixIcon: Icon(Icons.person)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Username is required';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: cnic,
                            decoration: InputDecoration(
                                labelText: 'NIC',
                                labelStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10),
                                prefixIcon: Icon(Icons.person)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'NIC is required';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: caddress,
                            decoration: InputDecoration(
                                labelText: 'Address',
                                labelStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10),
                                prefixIcon: Icon(Icons.mail_outline)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Address is required';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: cemail,
                            decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10),
                                prefixIcon: Icon(Icons.mail)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Email is required';
                              }
                              if (!value.contains('@')) {
                                return "A valid email should contain '@'";
                              }
                              if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                              ).hasMatch(value)) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: ctelno,
                            decoration: InputDecoration(
                                labelText: 'Telephone No',
                                labelStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10),
                                prefixIcon: Icon(Icons.phone)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Telephone NO is required';
                              }
                              if (value.length != 10) {
                                return 'A valid phone number should be of 10 digits';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            obscureText: showPassword = true,
                            controller: cpassword,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.grey,
                                  ),
                                ),
                                labelText: 'Password',
                                labelStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10),
                                prefixIcon: Icon(Icons.vpn_key)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password cannot be empty';
                              }
                              if (value.length < 8) {
                                return 'Password should have atleast 8 characters';
                              }
                              if (!value.contains(RegExp(r"[a-z]"))) {
                                return 'Password should have lowercase';
                              }
                              if (!value.contains(RegExp(r"[A-Z]"))) {
                                return 'Password should have Uppercase';
                              }
                              if (!value.contains(RegExp(r"[0-9]"))) {
                                return 'Password should have numbers';
                              }
                              if (!value.contains(
                                  RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                return 'Password should have Characters';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            obscureText: showPassword = true,
                            controller: crpass,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.grey,
                                  ),
                                ),
                                labelText: 'Confirm Password',
                                labelStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10),
                                prefixIcon: Icon(Icons.vpn_key)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Confirm the Password';
                              }
                              if (value != cpassword) {
                                return 'Confimation password does not match the entered password';
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

                              var name = cname.text;
                              var uname = cuname.text;
                              var nic = cnic.text;
                              var address = caddress.text;
                              var email = cemail.text;
                              var telno = ctelno.text;
                              var password = cpassword.text;

                              var rsp = await RegisterUser(name, uname, nic,
                                  address, email, telno, password);

                              print(rsp);
                              Strings.userId = rsp['user id'];
                              if (rsp.containsKey('status')) {
                                setState(() {
                                  mess = rsp['message'];
                                });
                                if (rsp['status'] == 1) {}
                              } else {
                                setState(() {
                                  mess = 'Try Again';
                                });
                              }
                              clearText();
                            },
                            btnText: 'Register',
                          ),
                          Text(mess),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Already have an Account'),
                              FlatButton(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.cyan),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
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

  Widget _textInput({controller, hint, icon, password}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 20),
      child: TextFormField(
        obscureText: password ? showPassword : false,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: password
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            border: InputBorder.none,
            hintText: hint,
            contentPadding: EdgeInsets.only(left: 10),
            prefixIcon: Icon(icon)),
      ),
    );
  }
}
