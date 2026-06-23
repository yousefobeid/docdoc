import 'package:docdoc/features/home/data/model/specializations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/doctors_info_model.dart';
import '../data/model/specialization_data_model.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  //Union Type Declaration
  const factory HomeState.initial() = _Initial;
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(
    List<SpecializationData?>? specializationDataList,
  ) = SpecializationSuccess;
  const factory HomeState.specializationFailure(String error) =
      SpecializationFailure;

  const factory HomeState.doctorsSuccess(List<Doctors?>? doctorsList) =
      DoctorsSuccess;
  const factory HomeState.doctorsFailure(String error) = DoctorsFailure;
}
