import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:musifly/analytics/events/screen_names.dart';

class MusButtonToTest extends StatelessWidget {
  const MusButtonToTest({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(226, 114, 244, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          fixedSize: const Size(334, 89)),
      onPressed: () => context.pushReplacement(ScreenNames.test),
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
