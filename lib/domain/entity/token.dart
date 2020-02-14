class Token {
  final String accessToken;
  final String refreshToken;

  Token({
    this.accessToken,
    this.refreshToken,
  }) : assert(accessToken != null || refreshToken != null);
}
