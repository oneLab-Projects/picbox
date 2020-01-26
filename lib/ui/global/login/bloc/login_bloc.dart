import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:picbox/component/api_config.dart';
import 'package:picbox/component/resource.dart';
import 'package:picbox/data/repository/sessions_repository_impl.dart';
import 'package:picbox/ui/global/authentication/bloc/bloc.dart';

import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SessionsRepositoryImpl sessionsRepository;
  final AuthenticationBloc authenticationBloc;
  final String phoneNumber;

  LoginBloc(
      {@required this.sessionsRepository,
      @required this.authenticationBloc,
      this.phoneNumber})
      : assert(sessionsRepository != null),
        assert(authenticationBloc != null) {
    if (phoneNumber == null) add(LoginPhoneSubmitted(phoneNumber: phoneNumber));
  }

  @override
  LoginState get initialState => LoginPhoneInput();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginPhoneSubmitted) {
      yield LoginLoading();

      try {
        final confirmationId = await sessionsRepository.beginAuthentication(
          appId: ApiConfig.APP_ID,
          phoneNumber: event.phoneNumber,
        );
        if (confirmationId.type == ResourceType.Success) {
          add(LoginConfirmationCodeSent(confirmationId: confirmationId.data));
          yield LoginConfirmCodeInput();
        } else {
          yield LoginFailure(error: confirmationId.exception.toString());
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }

    if (event is LoginConfirmationCodeSubmitted) {
      yield LoginLoading();

      try {
        final token = await sessionsRepository.confirmAuthentication(
          confirmationId: event.confirmationId,
          confirmationCode: event.confirmationCode,
        );
        if (token.type == ResourceType.Success) {
          authenticationBloc.add(LoggedIn(token: token.data));
          yield LoginInitial();
        } else {
          yield LoginFailure(error: token.exception.toString());
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
