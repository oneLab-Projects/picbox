import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  @required
  final String id;
  @required
  final String username;
  @required
  final String firstName;
  @required
  final String lastName;
  final String phoneNumber;

  AccountModel({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.phoneNumber,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
