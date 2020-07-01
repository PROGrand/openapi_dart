/// Base class for exceptions which can be thrown by endpoint implementations
/// with special handling in the server implementations
/// (e.g. [OpenApiShelfServer]).
///
/// This allows custom status code responses without explicit definition
/// in the OpenApi yaml file.
abstract class OpenApiResponseException implements Exception {
  int get status;
  String get message;

  @override
  String toString() {
    return '$runtimeType{status=$status,message=$message}';
  }
}

/// Server exception which can be thrown by implementations of
/// the server endpoint to indicate a 401 response status.
class UnauthorizedException extends OpenApiResponseException
    implements Exception {
  UnauthorizedException(this.message);

  @override
  int get status => 401;

  @override
  final String message;
}
