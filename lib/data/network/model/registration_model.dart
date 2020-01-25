import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'registration_model.g.dart';

@JsonSerializable()
class RequestRegistrationModel {
  @required
  final String firstName;
  @required
  final String lastName;
  @required
  final String phoneNumber;

  RequestRegistrationModel({this.firstName, this.lastName, this.phoneNumber});

  factory RequestRegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$RequestRegistrationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestRegistrationModelToJson(this);
}
