import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:go_router/go_router.dart";
import "package:musifly/analytics/events/screen_names.dart";
import "package:musifly/core/mus.assets/export.dart";
import "package:musifly/core/mus.assets/mus.asset_image.dart";
import "package:musifly/core/mus.assets/mus.assets.dart";
import "package:musifly/presentation/providers/playlist_notifier.dart";
import "package:musifly/presentation/widgets/mus.my_playlists.dart";
import "package:provider/provider.dart";

import "../../widgets/mus.app_bar.dart";

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PlaylistNotifier>().getMyPlaylists();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF192352),
      appBar: const MusAppBar(),
      body: Container(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => context.push(ScreenNames.playlistCreate),
              child: const Row(
                children: [
                  SizedBox(
                    height: 75,
                    width: 100,
                    child: MusAssetImage(MusAssets.addPlaylist),
                  ),
                  Text('Create new playlist',
                      style: TextStyle(color: Colors.white, fontSize: 18))
                ],
              ),
            ),
            const Gap(5),
            Consumer<PlaylistNotifier>(builder: (context, notifier, _) {
              return Consumer<PlaylistNotifier>(
                builder: (context, state, child) {
                  if (state.playlists.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return MyPlaylists(data: state.playlists);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
