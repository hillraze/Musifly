import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

import "../../widgets/mus.app_bar.dart";

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF192352),
      appBar: const MusAppBar(
        title: 'Favourites',
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
