import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_request_body.g.dart';
@JsonSerializable()
class SignUpRequestBody {
  final String name;
  final String email;
  final String phone;
  final String password;
  @JsonKey(name: 'confirm_password')
  final String confirmPassword;
  final int gender;
  SignUpRequestBody({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.gender,
  });
  factory SignUpRequestBody.fromJson(Map<String, dynamic> json) => _$SignUpRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
