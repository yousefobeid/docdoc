import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/features/sign_up/data/model/sign_up_response.dart';

import '../data/model/sign_up_request_body.dart';

class SignUpRepo {
  final ApiService _apiService;
  SignUpRepo(this._apiService);
  Future<ApiResult<SignUpResponse>> signUp(
    SignUpRequestBody signUpRequestBody,
  ) async {
    try {
      final response = await _apiService.signUp(signUpRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
