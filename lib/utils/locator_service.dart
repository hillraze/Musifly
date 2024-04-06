import 'package:dio/dio.dart';
import 'package:musifly/data/data_sources/api/dio/dio_client.dart';
import 'package:musifly/data/data_sources/api/rest_client/rest_client.dart';
import 'package:retrofit/retrofit.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future initLocator() async {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerLazySingleton<RestClient>(() => RestClient(getIt<Dio>()));
}
