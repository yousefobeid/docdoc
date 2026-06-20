import 'package:docdoc/features/home/data/model/specialization_data_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'specializations_response_model.g.dart';

@JsonSerializable()
class SpecializationResponseModel {
  @JsonKey(name: "data")
  List<SpecializationData?>? specializationDataList;
  SpecializationResponseModel({this.specializationDataList});
  factory SpecializationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationResponseModelFromJson(json);
}

