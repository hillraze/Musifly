import 'package:get_it/get_it.dart';
import 'package:musifly/data/data_sources/api/serverpod/serverpod_client.dart';
import 'package:musifly/presentation/providers/player_notifier.dart';

final getIt = GetIt.instance;

Future initLocator() async {
  getIt.registerSingleton<ClientServerpod>(

      //IP ADRESS HERE:
      ClientServerpod('http://192.168.0.173:8080/'));
}
