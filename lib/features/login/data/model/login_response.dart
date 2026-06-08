import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  @JsonKey(name: 'data')
  UserDate? userDate;
  int? code;
  bool? status;
  LoginResponse({this.message, this.code, this.status, this.userDate});
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class UserDate {
  String? token;
  @JsonKey(name: "username")
  String? name;
  UserDate({this.token, this.name});
  factory UserDate.fromJson(Map<String, dynamic> json) =>
      _$UserDateFromJson(json);
  Map<String, dynamic> toJson() => _$UserDateToJson(this);
}
