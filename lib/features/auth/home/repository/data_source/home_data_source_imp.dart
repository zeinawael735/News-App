import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/result_api/result_api.dart';
import 'package:news_app/features/auth/home/data/models/success_response.dart';
import 'package:news_app/features/auth/home/repository/data_source/home_data_source_interface.dart';

class HomeDataSourceImp implements HomeDataSourceInterface{
  @override
  Future<ResultApi<SuccessResponseModel>> getNews() async{
    try {
      Uri url=Uri.https("newsapi.org","/v2/everything",{
        "q":"tesla",
        "apiKey":"f9d690a2fd534d438cf6fd5bd742387d"
      });

      var response=await http.get(url);
      var responseBody=response.body;
      var json=jsonDecode(responseBody);
      var data= SuccessResponseModel.fromJson(json);
      return Success<SuccessResponseModel>(data);

    }
    catch(e){
      return Error<SuccessResponseModel>(e.toString());
    }
  }

}