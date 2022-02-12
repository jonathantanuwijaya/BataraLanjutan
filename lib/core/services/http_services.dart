part of 'services.dart';

class HttpServices {
  final _dio = Dio();
  final _log = AppLogger('HttpServices');

  Future get(String route, {Map<String, dynamic>? params}) async {
    _log.info('Sending GET request to $route and query parameters = $params');

    try {
      Response response = await _dio.get(
        route,
        queryParameters: params,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          responseType: ResponseType.json,
        ),
      );
      return response.data;
    } on DioError catch (e) {
      _log.error('Failed to GET : ${e.message}');
      throw ApiResponseException(
          message: e.response!.data['meta']['message'],
          code: e.response!.statusCode);
    }
  }
}
