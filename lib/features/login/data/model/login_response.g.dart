// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as bool?,
      userDate: json['data'] == null
          ? null
          : UserDate.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.userDate,
      'code': instance.code,
      'status': instance.status,
    };

UserDate _$UserDateFromJson(Map<String, dynamic> json) =>
    UserDate(token: json['token'] as String, name: json['username'] as String?);

Map<String, dynamic> _$UserDateToJson(UserDate instance) => <String, dynamic>{
  'token': instance.token,
  'username': instance.name,
};
