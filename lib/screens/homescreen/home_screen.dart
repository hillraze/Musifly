import "package:flutter/material.dart";
import "package:musifly/widgets/mus.albums.dart";
import "package:musifly/widgets/mus.app_bar.dart";
import "package:musifly/widgets/mus.songs.dart";

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
