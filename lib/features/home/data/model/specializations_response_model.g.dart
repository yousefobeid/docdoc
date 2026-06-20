// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specializations_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationResponseModel _$SpecializationResponseModelFromJson(
  Map<String, dynamic> json,
) => SpecializationResponseModel(
  specializationDataList: (json['data'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : SpecializationData.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$SpecializationResponseModelToJson(
  SpecializationResponseModel instance,
) => <String, dynamic>{'data': instance.specializationDataList};
