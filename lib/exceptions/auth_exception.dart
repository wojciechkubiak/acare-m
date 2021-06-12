class AuthException implements Exception {
  final String message;

  AuthException({this.message = 'Wystąpił nieznany błąd'});
}