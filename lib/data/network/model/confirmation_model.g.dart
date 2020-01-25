// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirmation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmationModel _$ConfirmationModelFromJson(Map<String, dynamic> json) {
  return ConfirmationModel(
    confirmationId: json['confirmationId'] as String,
  );
}

Map<String, dynamic> _$ConfirmationModelToJson(ConfirmationModel instance) =>
    <String, dynamic>{
      'confirmationId': instance.confirmationId,
    };

RequestConfirmationModel _$RequestConfirmationModelFromJson(
    Map<String, dynamic> json) {
  return RequestConfirmationModel(
    confirmationId: json['confirmationId'] as String,
    confirmationCode: json['confirmationCode'] as String,
  );
}

Map<String, dynamic> _$RequestConfirmationModelToJson(
        RequestConfirmationModel instance) =>
    <String, dynamic>{
      'confirmationId': instance.confirmationId,
      'confirmationCode': instance.confirmationCode,
    };
