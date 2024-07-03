import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:musifly/core/mus.assets/mus.asset_image.dart';
import 'package:musifly/core/mus.assets/mus.assets.dart';
import 'package:musifly/presentation/screens/search/search_notifier.dart';
import 'package:musifly/presentation/widgets/mus.album_tracks.dart';
import 'package:musifly/utils/show_feature_notification.dart';
import 'package:provider/provider.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF192352),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: SizedBox.square(
            dimension: 10,
            child: Center(
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(121, 158, 158, 158),
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  )
                ]),
                child: const MusAssetImage(
                  MusAssets.back,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Consumer<SearchNotifier>(builder: (context, notifier, _) {
        return Column(
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(notifier.currentAlbum!.coverUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<SearchNotifier>(builder: (context, notifier, _) {
                      if (notifier.currentAlbum == null) {
                        return const CircularProgressIndicator();
                      }
                      final album = notifier.currentAlbum!;
                      return Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          album.title,
                          style: const TextStyle(
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(130, 0, 0, 0),
                                blurRadius: 10,
                                offset: Offset(0, 1),
                              )
                            ],
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }),
                    Consumer<SearchNotifier>(builder: (context, notifier, _) {
                      if (notifier.currentAlbum == null) {
                        return const CircularProgressIndicator();
                      }
                      final album = notifier.currentAlbum;
                      return Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          album!.artist!.name,
                          style: const TextStyle(
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(130, 0, 0, 0),
                                blurRadius: 10,
                                offset: Offset(0, 1),
                              )
                            ],
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Row(
                        children: [
                          MusAssetImage(MusAssets.planet),
                          Gap(15),
                          Text(
                            '0min',
                            style: TextStyle(
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Color.fromARGB(130, 0, 0, 0),
                                  blurRadius: 10,
                                  offset: Offset(0, 1),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(15),
                    Row(
                      children: [
                        const Gap(15),
                        GestureDetector(
                          onTap: () => showFeatureNotification(context),
                          child: const MusAssetImage(
                            MusAssets.invite,
                            height: 30,
                          ),
                        ),
                        const Gap(25),
                        GestureDetector(
                          onTap: () => showFeatureNotification(context),
                          child: const MusAssetImage(
                            MusAssets.share,
                            height: 30,
                          ),
                        ),
                        const Gap(25),
                        GestureDetector(
                          onTap: () => showFeatureNotification(context),
                          child: const MusAssetImage(
                            MusAssets.vdots,
                            height: 25,
                          ),
                        ),
                      ],
                    ),
                    const Gap(15),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 400,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<SearchNotifier>(builder: (context, notifier, _) {
                    if (notifier.currentAlbum == null) {
                      return const CircularProgressIndicator();
                    }
                    final albumTracks = notifier.currentAlbum!.tracks!;

                    return AlbumTracks(
                        tracks: albumTracks,
                        artist: notifier.currentAlbum!.artist,
                        cover: notifier.currentAlbum!.coverUrl);
                  }),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
