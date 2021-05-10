import 'package:auction_app/constants/strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future loginUser(String uname, String password) async {
  String username = 'adminuser';
  String pass = '2s7erwy0ri85sgfj';
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$pass'));
  print(basicAuth);

  final response = await http.post(
      Uri.parse('http://digitalprintingsrilanka.com/ashini/apilogin.php'),
      headers: <String, String>{'authorization': basicAuth},
      body: {'Name': uname, 'Pass': password});
  Strings.user = uname;
  Strings.userId = uname;

  var convertedDatatoJson = jsonDecode(response.body);

  return convertedDatatoJson;
}

Future RegisterUser(String name, String uname, String nic, String address,
    String email, String telno, String password) async {
  String username = 'adminuser';
  String pass = '2s7erwy0ri85sgfj';
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$pass'));
  print(basicAuth);

  final response = await http.post(
      Uri.parse('http://digitalprintingsrilanka.com/ashini/apiregister.php'),
      headers: <String, String>{
        'authorization': basicAuth
      },
      body: {
        'Name': name,
        'uname': uname,
        'nic': nic,
        'address': address,
        'email': email,
        'teleno': telno,
        'Pass': password
      });

  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}

Future userbids(String aucid, String uid, String bamount) async {
  String username = 'adminuser';
  String pass = '2s7erwy0ri85sgfj';
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$pass'));
  print(basicAuth);

  final response = await http.post(
      Uri.parse('http://digitalprintingsrilanka.com/ashini/apibids.php'),
      headers: <String, String>{
        'authorization': basicAuth
      },
      body: {
        'auctionid': aucid,
        'userid': uid,
        'bidamount': bamount,
      });
  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}
