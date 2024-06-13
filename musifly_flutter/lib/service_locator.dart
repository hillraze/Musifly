import 'package:get_it/get_it.dart';
import 'package:musifly/data/data_sources/api/serverpod/serverpod_client.dart';

final getIt = GetIt.instance;

Future initLocator() async {
  getIt.registerSingleton<ServerpodClient>(

      //IP ADRESS HERE:
      ServerpodClient('http://192.168.0.24:8080/'));
}
