import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

Dio buildDioClient(String base) {
  final dio = Dio()..options = BaseOptions(baseUrl: base);

  return dio;
}
