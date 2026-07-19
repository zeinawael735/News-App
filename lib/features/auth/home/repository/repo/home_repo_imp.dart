import 'package:news_app/core/result_api/result_api.dart';
import 'package:news_app/features/auth/home/data/models/success_response.dart';
import 'package:news_app/features/auth/home/repository/repo/home_repo_interface.dart';

import '../data_source/home_data_source_interface.dart';

class HomeRepoImp implements HomeRepoInterface{
  final HomeDataSourceInterface _dataSource;
  HomeRepoImp(this._dataSource);
  @override
  Future<ResultApi<List<Articles>>> getNews()async{
    final result=  await _dataSource.getNews();
    switch(result){
      case Success<SuccessResponseModel>():
        final newsModel=result.data;
        List<Articles> listOfArticles=newsModel?.articles??[];
        final newList=listOfArticles.where((element) => element.urlToImage!=null).toList();
        return Success<List<Articles>>(newList );
      case Error<SuccessResponseModel>():
       return Error<List<Articles>>(result.messageError);
    }
  }
}