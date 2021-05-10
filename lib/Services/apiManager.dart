import 'dart:convert';

import 'package:auction_app/constants/strings.dart';
import 'package:auction_app/models/bidinfo.dart';
import 'package:auction_app/models/productinfo.dart';
import 'package:auction_app/models/userbids.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  Future<Welcome> getItems() async {
    var client = http.Client();
    var newsModel;
    try {
      // var response = await client.get(
      //     'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=90b35a0cdda7470c88533a190b55baf9');
      var response = await client
          .get('http://digitalprintingsrilanka.com/ashini/apiitemview.php');

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = Welcome.fromJson(jsonMap);
        print(newsModel.toString());
        return newsModel;
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }

  Future<Bids> getBids() async {
    var client = http.Client();
    var bidModel;

    try {
      var response = await client
          .get('http://digitalprintingsrilanka.com/ashini/apitest.php');
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        bidModel = Bids.fromJson(jsonMap);
        print(bidModel.toString());
        return bidModel;
      }
    } catch (Exception) {
      return bidModel;
    }
    return bidModel;
  }

  Future<Results> userBids(String uid) async {
    var mybidmodel;
    String username = 'adminuser';
    String pass = '2s7erwy0ri85sgfj';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$pass'));
    print(basicAuth);

    final response = await http.post(
        Uri.parse('http://digitalprintingsrilanka.com/ashini/apimybidview.php'),
        headers: <String, String>{
          'authorization': basicAuth
        },
        body: {
          'userid': uid,
        });
    if (response.statusCode == 201) {
      return Results.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
