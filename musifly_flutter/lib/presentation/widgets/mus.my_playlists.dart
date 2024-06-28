import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:musifly/analytics/events/screen_names.dart';
import 'package:musifly/core/core.dart';
import 'package:musifly/core/mus.assets/mus.asset_image.dart';
import 'package:musifly/presentation/providers/playlist_notifier.dart';
import 'package:musifly_client/musifly_client.dart';
import 'package:provider/provider.dart';

class MyPlaylists extends StatelessWidget {
  const MyPlaylists({super.key, required this.data});

  final List<Playlist> data;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
          child: Center(
        child: Container(
          width: double.infinity,
          height: 550,
          child: LayoutBuilder(builder: (context, constraints) {
            return GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.length,
                padding: const EdgeInsets.only(left: 11),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: constraints.maxWidth * 0.2),
                itemBuilder: (BuildContext context, int index) {
                  final playlist = data[index];
                  final playlistLength = playlist.playlistTracks?.length;
                  return Consumer<PlaylistNotifier>(
                      builder: (context, notifier, _) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        context.read<PlaylistNotifier>().setPlaylist(playlist);
                        context.push(ScreenNames.playlist);
                      },
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 70,
                              width: 70,
                              child: MusAssetImage(
                                MusAssets.defaultCover,
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  playlist.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Flexible(
                                  child: Text(
                                    '$playlistLength songs',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Spacer(),
                          // const Gap(5),
                          // Consumer<PlaylistNotifier>(
                          //   builder: (context, notifier, _) {
                          //     return GestureDetector(
                          //       onTap: () => notifier.setPlaylistSong(track),
                          //       child: const MusAssetImage(MusAssets.addSong)
                          //       );
                          //   }
                          // ),
                          // const Gap(15)
                        ],
                      ),
                    );
                  });
                });
          }),
        ),
      )),
    ]);
  }
}
