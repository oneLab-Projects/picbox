import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'registration_model.g.dart';

@JsonSerializable()
class RequestRegistrationModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;

  RequestRegistrationModel({
    @required this.firstName,
    @required this.lastName,
    @required this.phoneNumber,
  });

  factory RequestRegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$RequestRegistrationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestRegistrationModelToJson(this);
}
