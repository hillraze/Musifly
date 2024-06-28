import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:musifly/core/core.dart';
import 'package:musifly/core/mus.assets/mus.asset_image.dart';
import 'package:musifly/presentation/providers/playlist_notifier.dart';
import 'package:musifly_client/musifly_client.dart';
import 'package:provider/provider.dart';

class PlaylistTracks extends StatelessWidget {
  const PlaylistTracks({super.key, required this.data});
  final List<PlaylistTrack> data;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 300,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: data.length,
                        padding: const EdgeInsets.only(left: 1, top: 10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisExtent: constraints.maxWidth * 0.2),
                        itemBuilder: (BuildContext context, int index) {
                          final playlistTrack = data[index];
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              // context.push(ScreenNames.player,
                              //     extra: {'track': playlistTrack});
                            },
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    // decoration: playlistTrack
                                    //             .track!.album!.coverUrl !=
                                    //         null
                                    //     ? BoxDecoration(
                                    //         image: DecorationImage(
                                    //         image: NetworkImage(playlistTrack
                                    //                 .track!.album!.coverUrl ??
                                    //             ''),
                                    //       ))
                                    //     : null,
                                    child: const MusAssetImage(
                                      MusAssets.defaultCover,
                                    ),
                                  ),
                                ),
                                const Gap(7),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        playlistTrack.track!.title,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Flexible(
                                        child: Text(
                                          playlistTrack.track!.artist!.name,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Spacer(),
                                const Gap(5),
                                Consumer<PlaylistNotifier>(
                                    builder: (context, notifier, _) {
                                  return GestureDetector(
                                      onTap: () => showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255,
                                                      31,
                                                      31,
                                                      31), // Darker grey color
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(25),
                                                    topRight:
                                                        Radius.circular(25),
                                                  )),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20, left: 20),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Consumer<
                                                              PlaylistNotifier>(
                                                          builder: (context,
                                                              notifier, _) {
                                                        return Container(
                                                          // height: 20,
                                                          // width: 100,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () => {
                                                              notifier.deleteTracks(
                                                                  playlistTrack
                                                                      .trackId)
                                                            },
                                                            child: const Row(
                                                              children: [
                                                                MusAssetImage(
                                                                    MusAssets
                                                                        .deleteButton),
                                                                Gap(15),
                                                                Text(
                                                                  'Delete from this playlist',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                      child: const MusAssetImage(
                                        MusAssets.vdots,
                                        width: 5,
                                      ));
                                }),
                                const Gap(15)
                              ],
                            ),
                          );
                        });
                  }),
                ),
              ))),
    ]);
  }
}
