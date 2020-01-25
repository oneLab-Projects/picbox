import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'confirmation_model.g.dart';

@JsonSerializable()
class ConfirmationModel {
  @required
  final String confirmationId;

  ConfirmationModel({this.confirmationId});

  factory ConfirmationModel.fromJson(Map<String, dynamic> json) =>
      _$ConfirmationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmationModelToJson(this);
}

@JsonSerializable()
class RequestConfirmationModel {
  @required
  final String confirmationId;
  @required
  final String confirmationCode;

  RequestConfirmationModel({this.confirmationId, this.confirmationCode});

  factory RequestConfirmationModel.fromJson(Map<String, dynamic> json) =>
      _$RequestConfirmationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestConfirmationModelToJson(this);
}
