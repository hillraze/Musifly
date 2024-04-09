import "package:flutter/material.dart";

import "../../widgets/mus.albums.dart";
import "../../widgets/mus.app_bar.dart";
import "../../widgets/mus.songs.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF192352),
      appBar: MusAppBar(
        title: 'Musifly',
      ),
      body: Column(
        children: [MusAlbum(), MusSongs()],
      ),
    );
  }
}
