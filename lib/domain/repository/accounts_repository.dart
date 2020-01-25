import 'package:picbox/component/resource.dart';
import 'package:picbox/domain/entity/account.dart';

abstract class AccountsRepository {
  Future<DataResource<bool>> checkAccount({
    String phoneNumber,
  });

  Future<DataResource<Account>> getAccount({
    String accountId,
  });

  Future<DataResource<String>> beginRegistration({
    String firstName,
    String lastName,
    String phoneNumber,
  });

  Future<DataResource<Account>> confirmRegistration({
    String confirmationId,
    String confirmationCode,
  });
}
