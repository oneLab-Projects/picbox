// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessions_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$SessionsApiService extends SessionsApiService {
  _$SessionsApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = SessionsApiService;

  @override
  Future<Response<ConfirmationModel>> beginAuthentication(
      RequestAuthenticationModel request) {
    final $url = 'https://api.onelab.work/identity/sessions';
    final $headers = {'Stage': 'begin'};
    final $body = request;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ConfirmationModel, ConfirmationModel>($request);
  }

  @override
  Future<Response<TokenModel>> confirmAuthentication(
      RequestConfirmationModel request) {
    final $url = 'https://api.onelab.work/identity/sessions';
    final $headers = {'Stage': 'confirm'};
    final $body = request;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<TokenModel, TokenModel>($request);
  }

  @override
  Future<Response<TokenModel>> refreshToken(RequestTokenModel request) {
    final $url = 'https://api.onelab.work/identity/sessions';
    final $headers = {'Stage': 'refresh'};
    final $body = request;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<TokenModel, TokenModel>($request);
  }
}
