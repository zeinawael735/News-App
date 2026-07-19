import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/result_api/result_api.dart';
import 'package:news_app/features/auth/home/data/models/success_response.dart';
import 'package:news_app/features/auth/home/repository/repo/home_repo_interface.dart';

import '../data/api/api.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
      this._repo,
      ) : super(HomeInitial());
final HomeRepoInterface _repo;
  void fetchNews() async {
    emit(HomeLoading());
    var result = await _repo.getNews();
   switch(result) {
     case Success<List<Articles>>():
      emit(HomeSuccess(result.data??[]));
     case Error<List<Articles>>():
       emit(HomeError(result.messageError));
   }
  }
}
