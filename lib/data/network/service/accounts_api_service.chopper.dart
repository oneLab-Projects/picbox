// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$AccountsApiService extends AccountsApiService {
  _$AccountsApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AccountsApiService;

  @override
  Future<Response> checkAccount({String phoneNumber}) {
    final $url = 'https://api.onelab.work/identity/accounts';
    final $params = <String, dynamic>{'phoneNumber': phoneNumber};
    final $request = Request('HEAD', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<AccountModel>> getAccount({String accountId}) {
    final $url = 'https://api.onelab.work/identity/accounts/$accountId';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<AccountModel, AccountModel>($request);
  }

  @override
  Future<Response<ConfirmationModel>> beginRegistration(
      RequestRegistrationModel request) {
    final $url = 'https://api.onelab.work/identity/accounts';
    final $headers = {'Stage': 'begin'};
    final $body = request;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ConfirmationModel, ConfirmationModel>($request);
  }

  @override
  Future<Response<AccountModel>> confirmRegistration(
      RequestConfirmationModel request) {
    final $url = 'https://api.onelab.work/identity/accounts';
    final $headers = {'Stage': 'confirm'};
    final $body = request;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<AccountModel, AccountModel>($request);
  }
}
