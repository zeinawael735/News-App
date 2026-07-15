import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/success_response.dart';

class Api {


static Future<SuccessResponseModel>getNews()async{
  Uri url=Uri.https("newsapi.org","/v2/everything",{
    "q":"bitcoin",
    "apiKey":"f9d690a2fd534d438cf6fd5bd742387d"
  });

  var response=await http.get(url);
  var responseBody=response.body;
  var json=jsonDecode(responseBody);
  return SuccessResponseModel.fromJson(json);
}






}