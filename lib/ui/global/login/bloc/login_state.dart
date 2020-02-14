import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginPhoneInput extends LoginState {}

class LoginLoading extends LoginState {}

class LoginConfirmCodeInput extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
