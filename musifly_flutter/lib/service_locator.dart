import 'package:get_it/get_it.dart';
import 'package:musifly/data/data_sources/api/serverpod/serverpod_client.dart';

final getIt = GetIt.instance;

Future initLocator() async {
  getIt.registerSingleton<ServerpodApi>(

      //IP ADRESS HERE:
      ServerpodApi('http://192.168.1.3:8080/'));
}
