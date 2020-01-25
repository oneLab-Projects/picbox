import 'package:chopper/chopper.dart';
import 'package:picbox/data/network/model/authentication_model.dart';
import 'package:picbox/data/network/model/confirmation_model.dart';
import 'package:picbox/data/network/model/token_model.dart';

part 'sessions_api_service.chopper.dart';

@ChopperApi(baseUrl: "https://api.onelab.work/identity/sessions")
abstract class SessionsApiService extends ChopperService {
  /// Начало процесса авторизации.
  ///
  /// Отправляет данные для авторизации в виде [RequestAuthenticationModel],
  /// возвращает индикатор сессии подтверждения в виде [ConfirmationModel].
  @Post(headers: {'Stage': 'begin'})
  Future<Response<ConfirmationModel>> beginAuthentication(
    @Body() RequestAuthenticationModel request,
  );

  /// Конец процесса регистрации.
  ///
  /// Отправляет индикатор сессии подтверждения и код подтверждения виде [RequestRegistrationModel],
  /// возвращает данные об аккаунте в виде [AccountModel].
  @Post(headers: {'Stage': 'confirm'})
  Future<Response<TokenModel>> confirmAuthentication(
    @Body() RequestConfirmationModel request,
  );

  /// Отправляет refresh-токен виде [RequestTokenModel],
  /// возвращает обновленные access- и refresh-токены в виде [TokenModel].
  @Post(headers: {'Stage': 'refresh'})
  Future<Response<TokenModel>> refreshToken(
    @Body() RequestTokenModel request,
  );
}
