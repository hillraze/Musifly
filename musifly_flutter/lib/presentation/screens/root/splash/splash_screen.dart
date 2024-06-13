import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:musifly/analytics/events/screen_names.dart';
import 'package:musifly/core/mus.assets/mus.asset_image.dart';
import 'package:musifly/core/mus.assets/mus.assets.dart';
import 'package:musifly/data/data_sources/api/serverpod/serverpod_client.dart';
import 'package:musifly/presentation/providers/app_notifier.dart';
import 'package:musifly/service_locator.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    getAlbums();
    getTracks();
    _navigateAway();
  }

  Future getAlbums() async {
    try {
      final albums = await getIt<ServerpodClient>().getNewAlbums();
      print("Splash > get new albums: $albums");
    } catch (e) {
      print("ERROR >>> SPLASH: $e");
    }
  }

  Future getTracks() async {
    try {
      final tracks = await getIt<ServerpodClient>().getNewTracks();
      print("Splash > get new tracks: $tracks");
    } catch (e) {
      print("ERROR >>> SPLASH: $e");
    }
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const MusAssetImage(
      MusAssets.loading,
      width: double.infinity,
      height: double.infinity,
    );
  }

  void _navigateAway() async {
    final firstVisit = context.read<AppNotifier>().getFirstVisit();
    await Future.delayed(Duration(seconds: 3));
    if (mounted) {
      context.go(firstVisit ? ScreenNames.onboard : ScreenNames.home);
    }
  }
}
