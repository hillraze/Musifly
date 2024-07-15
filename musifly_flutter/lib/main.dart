import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musifly/analytics/events/core/dependency_squirrel.dart';
import 'package:musifly/presentation/navigation/router.dart';
import 'package:musifly/presentation/screens/album/album_notifier.dart';
import 'package:musifly/presentation/screens/home/home_screen_notifier.dart';
import 'package:musifly/presentation/screens/player/audio_handler.dart';
import 'package:musifly/presentation/screens/player/player_notifier.dart';
import 'package:musifly/presentation/screens/playlist/playlist_notifier.dart';
import 'package:musifly/presentation/screens/search/search_notifier.dart';
import 'package:musifly/service_locator.dart';
import 'package:musifly/utils/theme/mus.theme.dart';
import 'package:provider/provider.dart';

import 'presentation/providers/app_notifier.dart';
import 'utils/theme/mus.theme_provider.dart';

GlobalKey<NavigatorState> screenNavigatorKey = GlobalKey();
GlobalKey<NavigatorState> shellKey = GlobalKey();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final audioHandler = await AudioService.init(
    builder: MyAudioHandler.new,
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.musifly.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    ),
  );

  await Hive.initFlutter();
  await Hive.openBox('storage');

  RouterService.init(screenNavigatorKey, shellKey);

  await initLocator();

  runApp(MyApp(audioHandler: audioHandler));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.audioHandler}) : super(key: key);
  final AudioHandler audioHandler;

  @override
  Widget build(BuildContext context) {
    final musThemeProvider =
        MusThemeProvider(MusTheme(key: "default", name: 'default'));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => AppNotifier()),
        ChangeNotifierProvider<MusThemeProvider>(
            create: (_) => musThemeProvider, lazy: false),
        ChangeNotifierProvider(create: (_) => PlayerNotifier(audioHandler)),
        ChangeNotifierProvider(create: (_) => PlaylistNotifier()),
        ChangeNotifierProvider(create: (_) => SearchNotifier()),
        ChangeNotifierProvider(create: (_) => AlbumNotifier()),
      ],
      child: Listen<MusThemeProvider>(
        builder: (context) {
          return AudioServiceWidget(
            child: MaterialApp.router(
              routerConfig: RouterService.instance.goRouter,
              theme: ThemeData(
                fontFamily: 'Poppins',
              ),
            ),
          );
        },
      ),
    );
  }
}
