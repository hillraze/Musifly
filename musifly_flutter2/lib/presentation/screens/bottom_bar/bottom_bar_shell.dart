import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:musifly/analytics/events/screen_names.dart';
import 'package:musifly/core/mus.assets/export.dart';
import 'package:musifly/core/mus.assets/mus.asset_image.dart';
import 'package:musifly/utils/theme/mus.theme_provider.dart';

part 'bottom_bar.dart';

class BottomBarShell extends StatelessWidget {
  final GoRouterState state;
  final Widget child;

  const BottomBarShell({
    super.key,
    required this.state,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: child,
      bottomNavigationBar: MusBottomBar(
        state: state,
      ),
    );
  }
}
