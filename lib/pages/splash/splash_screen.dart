import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/mus.assets/mus.assets.dart';
import 'package:flutter_application_1/core/mus.assets/mus.asset_image.dart';

class splash_screen_page extends StatelessWidget {
  const splash_screen_page({super.key});
  @override
  Widget build(BuildContext context) {
    return const MusAssetImage(
      MusAssets.loading,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
