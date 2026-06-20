import 'package:docdoc/features/home/data/model/specializations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  //Union Type Declaration
  const factory HomeState.initial() = _Initial;
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(
    SpecializationResponseModel specializationResponseModel,
  ) = SpecializationSuccess;
  const factory HomeState.specializationFailure(String error) =
      SpecializationFailure;
}
