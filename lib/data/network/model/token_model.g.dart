// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) {
  return TokenModel(
    accessToken: json['accessToken'] as String,
    refreshToken: json['refreshToken'] as String,
  );
}

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

RequestTokenModel _$RequestTokenModelFromJson(Map<String, dynamic> json) {
  return RequestTokenModel(
    refreshToken: json['refreshToken'] as String,
  );
}

Map<String, dynamic> _$RequestTokenModelToJson(RequestTokenModel instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
    };
