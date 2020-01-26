import 'package:chopper/chopper.dart';
import 'package:picbox/component/api_config.dart';
import 'package:picbox/data/network/model/confirmation_model.dart';
import 'package:picbox/data/network/model/account_model.dart';
import 'package:picbox/data/network/model/registration_model.dart';

part 'accounts_api_service.chopper.dart';

@ChopperApi(baseUrl: ApiConfig.BASE_API_URL + "identity/accounts")
abstract class AccountsApiService extends ChopperService {
  /// Проверяет существование аккаунта с указанным в `phoneNumber` номером.
  @Head()
  Future<Response> checkAccount({
    @Query("phoneNumber") String phoneNumber,
  });

  /// Получает доступную информацию об аккаунте с указанным в `accountId` индикатором.
  @Get(path: "/{accountId}")
  Future<Response<AccountModel>> getAccount({
    @Path("accountId") String accountId,
  });

  /// Начало процесса регистрации.
  ///
  /// Отправляет данные для регистрации в виде [RequestRegistrationModel],
  /// возвращает индикатор сессии подтверждения в виде [ConfirmationModel].
  @Post(headers: {'Stage': 'begin'})
  Future<Response<ConfirmationModel>> beginRegistration(
    @Body() RequestRegistrationModel request,
  );

  /// Конец процесса регистрации.
  ///
  /// Отправляет индикатор сессии подтверждения и код подтверждения виде [RequestRegistrationModel],
  /// возвращает данные об аккаунте в виде [AccountModel].
  @Post(headers: {'Stage': 'confirm'})
  Future<Response<AccountModel>> confirmRegistration(
    @Body() RequestConfirmationModel request,
  );
}
