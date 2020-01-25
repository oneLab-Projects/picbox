import 'package:picbox/component/resource.dart';
import 'package:picbox/domain/entity/token.dart';

abstract class SessionsRepository {
  Future<void> persistToken(Token token);

  Future<void> deleteToken();

  Future<bool> hasToken();

  Future<DataResource<String>> beginAuthentication({
    String appId,
    String phoneNumber,
  });

  Future<DataResource<Token>> confirmAuthentication({
    String confirmationId,
    String confirmationCode,
  });

  Future<DataResource<Token>> refreshToken({
    String refreshToken,
  });
}
