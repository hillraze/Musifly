import "package:flutter/material.dart";
import "package:musifly/presentation/providers/home_screen_notifier.dart";
import "package:musifly/presentation/widgets/mus.songs.dart";
import "package:provider/provider.dart";

import "../../widgets/mus.albums.dart";
import "../../widgets/mus.app_bar.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().getNewAlbums();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().getNewSongs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF192352),
      appBar: const MusAppBar(
        title: 'Musifly',
      ),
      body: Column(
        children: [
          Consumer<HomeProvider>(
            builder: (context, state, child) {
              if (state.newAlbums.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return MusAlbum(data: state.newAlbums);
            },
          ),
          Consumer<HomeProvider>(
            builder: (context, state, child) {
              if (state.newSongs.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return MusSongs(data: state.newSongs);
            },
          )
        ],
      ),
    );
  }
}
