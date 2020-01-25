import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  @required
  final String accessToken;
  @required
  final String refreshToken;

  TokenModel({this.accessToken, this.refreshToken});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}

@JsonSerializable()
class RequestTokenModel {
  @required
  final String refreshToken;

  RequestTokenModel({this.refreshToken});

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTokenModelToJson(this);
}
