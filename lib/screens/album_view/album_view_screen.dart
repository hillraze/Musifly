import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:musifly/widgets/mus.app_bar.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF192352),
      appBar: MusAppBar(
        title: 'Musifly',
      ),
      body: Center(
        child: Column(
          children: [
            ColoredBox(
              color: Colors.red,
              child: SizedBox(
                width: 500,
                height: 500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
