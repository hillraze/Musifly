// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musifly/core/mus.assets/export.dart';
import 'package:musifly/core/mus.assets/mus.assets.dart';
import 'package:gap/gap.dart';

import '../../widgets/mus.button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(MusAssets.getStarted.path),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  // width: 334,
                  // height: 89,
                  child: Center(
                    child: MusButton(),
                  ),
                ),
                Gap(55)
              ],
            )));
  }
}
