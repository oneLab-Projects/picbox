import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authentication_model.g.dart';

@JsonSerializable()
class RequestAuthenticationModel {
  final String appId;
  final String phoneNumber;

  RequestAuthenticationModel({
    @required this.appId,
    @required this.phoneNumber,
  });

  factory RequestAuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$RequestAuthenticationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestAuthenticationModelToJson(this);
}
