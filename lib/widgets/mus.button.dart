import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:musifly/analytics/events/screen_names.dart';
import 'package:musifly/providers/onboard_provider.dart';
import 'package:provider/provider.dart';

class MusButton extends StatelessWidget {
  const MusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(226, 114, 244, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          fixedSize: const Size(334, 89)),
      onPressed: () {
        context.read<AppService>().setFirstVisit();
        context.pushReplacement(ScreenNames.home);
      },
      child: const Text(
        'Get Started',
        style: TextStyle(
            // fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            // fontStyle: FontStyle.italic,
            fontSize: 22,
            color: Colors.white),
      ),
    );
  }
}
