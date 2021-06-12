class AuthException implements Exception {
  final dynamic message;

  AuthException({this.message = 'Wystąpił nieznany błąd'}) {
    print('AuthException: $message');
  }
}
