class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic originalException;

  const ApiException(this.message, {this.statusCode, this.originalException});

  @override
  String toString() {
    return 'ApiException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
  }
}
