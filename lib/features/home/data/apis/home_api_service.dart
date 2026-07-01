import 'package:docdoc/features/home/data/model/specializations_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../../../../core/networking/api_constants.dart';
part 'home_api_service.g.dart';
//API Contract
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(ApiConstants.specializationEP)
Future<SpecializationResponseModel> getSpecialization();
}


// ex.
// class HomeApiService {
//
//   final Dio dio;
//
//   HomeApiService(this.dio);
//
//   Future<SpecializationResponseModel> getSpecialization() async {
//
//     final response = await dio.get(
//       "https://api.com/api/specialization",
//     );
//
//     return SpecializationResponseModel.fromJson(
//       response.data,
//     );
//   }
//
// }