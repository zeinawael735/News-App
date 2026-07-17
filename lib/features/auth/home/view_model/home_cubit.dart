import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/result_api/result_api.dart';
import 'package:news_app/features/auth/home/data/models/success_response.dart';

import '../data/api/api.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


  void fetchNews() async{
    emit(HomeLoading());
    var result = await Api.getNews();
    switch(result) {
      case Success<SuccessResponseModel>():
       emit(HomeSuccess(result.data?.articles??[]));
      case Error<SuccessResponseModel>():
emit(HomeError(result.messageError));
    }
  }

}
