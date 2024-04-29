import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:musifly/data/data_sources/api/go/rest_client/rest_client.dart';
import 'package:musifly/data/data_sources/api/serverpod/serverpod_client.dart';
import 'package:musifly/utils/interceptors/logger_interceptor.dart';

final getIt = GetIt.instance;

Future initLocator() async {
  final dio = Dio();
  dio.interceptors.addAll([
    LoggerInterceptor(),
  ]);

  getIt.registerSingleton<Dio>(dio);
  getIt.registerLazySingleton<RestClient>(() => RestClient(getIt<Dio>()));

  getIt.registerSingleton<ClientServerpod>(
      ClientServerpod('http://192.168.0.173:8080/'));
}
