import 'package:json_annotation/json_annotation.dart';

import 'doctors_info_model.dart';
part 'specialization_data_model.g.dart';
@JsonSerializable()
class SpecializationData {
  int? id;
  String? name;
  @JsonKey(name: "doctors")
  List<Doctors?>? doctorsList;
  SpecializationData({this.id, this.name, this.doctorsList});
  factory SpecializationData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationDataFromJson(json);
}
