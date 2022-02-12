part of 'exception.dart';

class ApiResponseException implements Exception {
  final String? message;
  String? uri;
  int? code;

  ApiResponseException({this.message, this.uri, this.code});

  ApiResponseException.fromResponse(ApiReturnValue response)
      : message = response.message;
  @override
  String toString() {
    return 'Galat API : ($code) $message [$uri]';
  }
}