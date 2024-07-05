import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:musifly/analytics/events/screen_names.dart';
import 'package:musifly/core/mus.assets/mus.asset_image.dart';
import 'package:musifly/core/mus.assets/mus.assets.dart';
import 'package:musifly/presentation/screens/search/search_notifier.dart';
import 'package:musifly_client/musifly_client.dart';
import 'package:provider/provider.dart';

class ArtistTracks extends StatelessWidget {
  ArtistTracks({super.key, required this.tracks, required this.artistName});
  List<Track> tracks;
  String artistName;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 400,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: tracks.length,
                        padding: const EdgeInsets.only(left: 1, top: 10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisExtent: constraints.maxWidth * 0.2),
                        itemBuilder: (BuildContext context, int index) {
                          final albumTrack = tracks[index];
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              context.push(ScreenNames.player,
                                  extra: {'track': albumTrack});
                            },
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    // decoration: albumTrack.album!.coverUrl !=
                                    //         null
                                    //     ? BoxDecoration(
                                    //         image: DecorationImage(
                                    //         image: NetworkImage(
                                    //             albumTrack.album!.coverUrl ??
                                    //                 ''),
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
                                        albumTrack.title,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Flexible(
                                        child: Text(
                                          // albumTrack.artist!.name,
                                          // albumTrack.artist!.name,
                                          // 'Artist Name',
                                          artistName,
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
                                Consumer<SearchNotifier>(
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
                                                      Consumer<SearchNotifier>(
                                                          builder: (context,
                                                              notifier, _) {
                                                        return Container(
                                                          // height: 20,
                                                          // width: 100,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                {context.pop()},
                                                            child: const Row(
                                                              children: [
                                                                MusAssetImage(
                                                                    MusAssets
                                                                        .deleteButton),
                                                                Gap(15),
                                                                Text(
                                                                  'Delete from this Album',
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
