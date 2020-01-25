import 'package:picbox/data/network/model/account_model.dart';
import 'package:picbox/data/network/model/token_model.dart';
import 'package:picbox/domain/entity/account.dart';
import 'package:picbox/domain/entity/token.dart';

class Mapper {
  const Mapper();

  Account mapAccountResponseToAccount(AccountModel model) {
    return Account(
      id: model.id,
      username: model.username,
      firstName: model.firstName,
      lastName: model.lastName,
      phoneNumber: model.phoneNumber,
    );
  }

  Token mapTokenResponseToToken(TokenModel model) {
    return Token(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
    );
  }
}
