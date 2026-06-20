import 'package:json_annotation/json_annotation.dart';
part 'doctors_info_model.g.dart';
@JsonSerializable()
class Doctors {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  @JsonKey(name: "appoint_price")
  int? price;
  String degree;
  Doctors({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.price,
    required this.degree,
  });
  factory Doctors.fromJson(Map<String, dynamic> json) =>
      _$DoctorsFromJson(json);
}
