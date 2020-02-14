import 'package:picbox/component/resource.dart';
import 'package:picbox/data/network/exception/server_exception.dart';
import 'package:picbox/data/network/model/confirmation_model.dart';
import 'package:picbox/data/network/model/registration_model.dart';
import 'package:picbox/data/network/service/accounts_api_service.dart';
import 'package:picbox/domain/entity/account.dart';
import 'package:picbox/domain/repository/accounts_repository.dart';
import 'mapper/mapper.dart';

class AccountsRepositoryImpl implements AccountsRepository {
  final AccountsApiService accountsApiService;
  final Mapper mapper;

  static const int _TIME_OUT = 10;

  AccountsRepositoryImpl({
    this.accountsApiService,
    this.mapper = const Mapper(),
  }) : assert(accountsApiService != null);

  @override
  Future<DataResource<bool>> checkAccount({
    String phoneNumber,
  }) async {
    try {
      final res = await accountsApiService
          .checkAccount(phoneNumber: phoneNumber)
          .timeout(Duration(seconds: _TIME_OUT));
      if ([204, 404].contains(res.statusCode)) {
        return DataResource(ResourceType.Success, data: res.statusCode == 204);
      } else {
        return DataResource(ResourceType.Error,
            exception: ServerException.fromJson(
                httpStatusCode: res.statusCode, errorBody: res.error));
      }
    } catch (ex) {
      return DataResource(ResourceType.Error, exception: ex);
    }
  }

  @override
  Future<DataResource<Account>> getAccount({
    String accountId,
  }) async {
    try {
      final res = await accountsApiService
          .getAccount(accountId: accountId)
          .timeout(Duration(seconds: _TIME_OUT));
      if (res.isSuccessful) {
        return DataResource(ResourceType.Success,
            data: mapper.mapAccountResponseToAccount(res.body));
      } else {
        return DataResource(ResourceType.Error,
            exception: ServerException.fromJson(
                httpStatusCode: res.statusCode, errorBody: res.error));
      }
    } catch (ex) {
      return DataResource(ResourceType.Error, exception: ex);
    }
  }

  @override
  Future<DataResource<String>> beginRegistration({
    String firstName,
    String lastName,
    String phoneNumber,
  }) async {
    try {
      final res = await accountsApiService
          .beginRegistration(RequestRegistrationModel(
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
          ))
          .timeout(Duration(seconds: _TIME_OUT));
      if (res.isSuccessful) {
        return DataResource(ResourceType.Success,
            data: res.body.confirmationId);
      } else {
        return DataResource(ResourceType.Error,
            exception: ServerException.fromJson(
                httpStatusCode: res.statusCode, errorBody: res.error));
      }
    } catch (ex) {
      return DataResource(ResourceType.Error, exception: ex);
    }
  }

  @override
  Future<DataResource<Account>> confirmRegistration({
    String confirmationId,
    String confirmationCode,
  }) async {
    try {
      final res = await accountsApiService
          .confirmRegistration(RequestConfirmationModel(
            confirmationId: confirmationId,
            confirmationCode: confirmationCode,
          ))
          .timeout(Duration(seconds: _TIME_OUT));
      if (res.isSuccessful) {
        return DataResource(ResourceType.Success,
            data: mapper.mapAccountResponseToAccount(res.body));
      } else {
        return DataResource(ResourceType.Error,
            exception: ServerException.fromJson(
                httpStatusCode: res.statusCode, errorBody: res.error));
      }
    } catch (ex) {
      return DataResource(ResourceType.Error, exception: ex);
    }
  }
}
