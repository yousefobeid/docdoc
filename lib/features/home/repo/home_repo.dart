import 'package:docdoc/features/home/data/apis/home_api_service.dart';
import 'package:docdoc/features/home/data/model/specializations_response_model.dart';

import '../../../core/networking/api_result.dart';

class HomeRepo {
  final HomeApiService _homeApiService;
  HomeRepo(this._homeApiService);
  Future<ApiResult<SpecializationResponseModel>> getSpecialization() async {
    try {
      final response = await _homeApiService.getSpecialization();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
