import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:picbox/domain/entity/token.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginPhoneSubmitted extends LoginEvent {
  final String phoneNumber;

  const LoginPhoneSubmitted({
    @required this.phoneNumber,
  });

  @override
  List<Object> get props => [phoneNumber];

  @override
  String toString() => 'LoginPhoneSubmitted { phone: $phoneNumber }';
}

class LoginConfirmationCodeSent extends LoginEvent {
  final String confirmationId;

  const LoginConfirmationCodeSent({
    @required this.confirmationId,
  });

  @override
  List<Object> get props => [confirmationId];

  @override
  String toString() =>
      'LoginConfirmationCodeSent { confirmationId: $confirmationId }';
}

class LoginConfirmationCodeSubmitted extends LoginEvent {
  final String confirmationId;
  final String confirmationCode;

  const LoginConfirmationCodeSubmitted({
    @required this.confirmationId,
    @required this.confirmationCode,
  });

  @override
  List<Object> get props => [confirmationId, confirmationCode];

  @override
  String toString() =>
      'LoginConfirmationCodeSubmitted { confirmationId: $confirmationId, confirmationCode: $confirmationCode }';
}