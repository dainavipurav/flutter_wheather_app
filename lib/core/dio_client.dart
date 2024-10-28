import 'package:dio/dio.dart';
import 'package:wheather_app/core/header_interceptor.dart';
import 'package:wheather_app/utils/utils.dart';

class DioClient {
  DioClient._privateConstructor() {
    addInterceptor(HeaderInterceptor());
    addInterceptor(LogInterceptor());
  }

  // Factory constructor to return a singleton instance
  static final DioClient _instance = DioClient._privateConstructor();
  factory DioClient() => _instance;

  final Dio dio = Dio(
    BaseOptions(baseUrl: AppStrings.baseUrl),
  );

  void addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
  }
}
