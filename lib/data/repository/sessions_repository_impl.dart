import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:picbox/component/resource.dart';
import 'package:picbox/data/network/exception/server_exception.dart';
import 'package:picbox/data/network/model/authentication_model.dart';
import 'package:picbox/data/network/model/confirmation_model.dart';
import 'package:picbox/data/network/model/token_model.dart';
import 'package:picbox/data/network/service/sessions_api_service.dart';
import 'package:picbox/domain/entity/token.dart';
import 'package:picbox/domain/repository/sessions_repository.dart';
import 'mapper/mapper.dart';

class SessionsRepositoryImpl implements SessionsRepository {
  SessionsApiService sessionsApiService;
  final Mapper mapper;

  static const int _TIME_OUT = 10;

  SessionsRepositoryImpl({
    this.sessionsApiService,
    this.mapper = const Mapper(),
  });

  @override
  Future<void> persistToken(Token token) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'accessToken', value: token.accessToken);
    await storage.write(key: 'refreshToken', value: token.refreshToken);
  }

  @override
  Future<void> deleteToken() async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: 'accessToken');
    await storage.delete(key: 'refreshToken');
  }

  Future<bool> hasToken() async {
    final storage = new FlutterSecureStorage();
    return (await storage.read(key: 'refreshToken')) != null;
  }

  @override
  Future<DataResource<String>> beginAuthentication({
    String appId,
    String phoneNumber,
  }) async {
    try {
      final res = await sessionsApiService
          .beginAuthentication(RequestAuthenticationModel(
            appId: appId,
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
  Future<DataResource<Token>> confirmAuthentication({
    String confirmationId,
    String confirmationCode,
  }) async {
    try {
      final res = await sessionsApiService
          .confirmAuthentication(RequestConfirmationModel(
            confirmationId: confirmationId,
            confirmationCode: confirmationCode,
          ))
          .timeout(Duration(seconds: _TIME_OUT));
      if (res.isSuccessful) {
        return DataResource(ResourceType.Success,
            data: mapper.mapTokenResponseToToken(res.body));
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
  Future<DataResource<Token>> refreshToken({
    String refreshToken,
  }) async {
    try {
      final res = await sessionsApiService
          .refreshToken(RequestTokenModel(
            refreshToken: refreshToken,
          ))
          .timeout(Duration(seconds: _TIME_OUT));
      if (res.isSuccessful) {
        return DataResource(ResourceType.Success,
            data: mapper.mapTokenResponseToToken(res.body));
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
