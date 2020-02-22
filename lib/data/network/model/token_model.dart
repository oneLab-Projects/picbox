import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  final String accessToken;
  final String refreshToken;

  TokenModel({
    @required this.accessToken,
    @required this.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}

@JsonSerializable()
class RequestTokenModel {
  final String refreshToken;

  RequestTokenModel({@required this.refreshToken});

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTokenModelToJson(this);
}
