import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'confirmation_model.g.dart';

@JsonSerializable()
class ConfirmationModel {
  final String confirmationId;

  ConfirmationModel({@required this.confirmationId});

  factory ConfirmationModel.fromJson(Map<String, dynamic> json) =>
      _$ConfirmationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmationModelToJson(this);
}

@JsonSerializable()
class RequestConfirmationModel {
  final String confirmationId;
  final String confirmationCode;

  RequestConfirmationModel({
    @required this.confirmationId,
    @required this.confirmationCode,
  });

  factory RequestConfirmationModel.fromJson(Map<String, dynamic> json) =>
      _$RequestConfirmationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestConfirmationModelToJson(this);
}
