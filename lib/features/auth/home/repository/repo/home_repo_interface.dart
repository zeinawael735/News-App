import '../../../../../core/result_api/result_api.dart';
import '../../data/models/success_response.dart';

abstract interface class HomeRepoInterface {
  Future<ResultApi<List<Articles>>>getNews();
}