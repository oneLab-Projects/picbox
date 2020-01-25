// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestAuthenticationModel _$RequestAuthenticationModelFromJson(
    Map<String, dynamic> json) {
  return RequestAuthenticationModel(
    appId: json['appId'] as String,
    phoneNumber: json['phoneNumber'] as String,
  );
}

Map<String, dynamic> _$RequestAuthenticationModelToJson(
        RequestAuthenticationModel instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'phoneNumber': instance.phoneNumber,
    };
