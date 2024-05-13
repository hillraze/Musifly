import 'package:flutter/material.dart';
import 'package:musifly/analytics/events/core/dependency_squirrel.dart';
import 'package:musifly/presentation/providers/home_screen_notifier.dart';
import 'package:musifly/presentation/providers/player_notifier.dart';
import 'package:musifly/utils/locator_service.dart';
import 'package:musifly/utils/theme/mus.theme.dart';
import 'package:provider/provider.dart';
// import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'presentation/providers/app_notifier.dart';
import 'package:musifly/presentation/navigation/router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'utils/theme/mus.theme_provider.dart';

GlobalKey<NavigatorState> screenNavigatorKey = GlobalKey();
GlobalKey<NavigatorState> shellKey = GlobalKey();

// var client = Client('http://192.168.16.1:8080/')
//   ..connectivityMonitor = FlutterConnectivityMonitor();

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('storage');
  RouterService.init(screenNavigatorKey, shellKey);

  await initLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
          ChangeNotifierProvider(create: (_) => PlayerNotifier()),
        ],
        child: Listen<MusThemeProvider>(builder: (context) {
          return MaterialApp.router(
            routerConfig: RouterService.instance.goRouter,
            theme: ThemeData(
              fontFamily: 'Poppins',
              // elevatedButtonTheme: ElevatedButtonThemeData(
              //   style: ButtonStyle(
              //     textStyle: MaterialStatePropertyAll<TextStyle>(
              //         TextStyle(fontFamily: 'Poppins')),
              //   ),
            ),
          );
        }));
  }
  // );
}



// 