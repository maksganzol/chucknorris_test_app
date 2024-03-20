import 'package:dio/dio.dart';

Dio setupDioClient() {
  return Dio(BaseOptions(baseUrl: 'https://api.chucknorris.io/'));
}
