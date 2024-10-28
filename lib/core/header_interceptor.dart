import 'package:dio/dio.dart';
import 'package:wheather_app/utils/utils.dart';

class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = AppStrings.baseUrl;
    options.contentType = Headers.jsonContentType;
    options.connectTimeout = const Duration(milliseconds: 180000);
    options.receiveTimeout = const Duration(milliseconds: 180000);
    options.headers[Headers.contentTypeHeader] = Headers.jsonContentType;

    print('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE => ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    if (err.response?.statusCode == 401) {
      // navigate to the authentication screen
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: err.message,
        ),
      );
    }
    return handler.next(err);
  }
}
