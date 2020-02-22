import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  AccountModel({
    @required this.id,
    @required this.username,
    @required this.firstName,
    @required this.lastName,
    this.phoneNumber,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
