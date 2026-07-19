import '../../../../../core/result_api/result_api.dart';
import '../../data/models/success_response.dart';

abstract interface class HomeDataSourceInterface {
  Future<ResultApi<SuccessResponseModel>>getNews();
}