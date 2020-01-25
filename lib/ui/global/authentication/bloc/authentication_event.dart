import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:picbox/domain/entity/token.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final Token token;

  const LoggedIn({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() =>
      'LoggedIn { accessToken: ${token.accessToken}, refreshToken: ${token.refreshToken} }';
}

class LoggedOut extends AuthenticationEvent {}
