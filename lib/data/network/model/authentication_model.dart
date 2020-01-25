import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authentication_model.g.dart';

@JsonSerializable()
class RequestAuthenticationModel {
  @required
  final String appId;
  @required
  final String phoneNumber;

  RequestAuthenticationModel({this.appId, this.phoneNumber});

  factory RequestAuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$RequestAuthenticationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestAuthenticationModelToJson(this);
}
