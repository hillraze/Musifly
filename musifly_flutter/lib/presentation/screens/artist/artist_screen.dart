import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:musifly/core/mus.assets/mus.asset_image.dart';
import 'package:musifly/core/mus.assets/mus.assets.dart';
import 'package:musifly/presentation/screens/playlist/playlist_notifier.dart';
import 'package:musifly/presentation/screens/search/search_notifier.dart';
import 'package:provider/provider.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({super.key});

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
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
      body: Consumer<PlaylistNotifier>(builder: (context, notifier, _) {
        return Column(
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(MusAssets.noteCover.path),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<SearchNotifier>(builder: (context, notifier, _) {
                      if (notifier.currentArtist == null) {
                        return const CircularProgressIndicator();
                      }
                      final artist = notifier.currentArtist!;
                      return Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          artist.name,
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
                    const Gap(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 200,
                          padding: const EdgeInsets.only(bottom: 20),
                          child: const Text(
                            '70.5m monthly listeners',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              shadows: [
                                Shadow(
                                  color: Color.fromARGB(130, 0, 0, 0),
                                  blurRadius: 10,
                                  offset: Offset(0, 1),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<SearchNotifier>(builder: (context, notifier, _) {
                    if (notifier.currentArtist == null) {
                      return const CircularProgressIndicator();
                    }
                    // final artistTracks = notifier.currentArtist?.albums.;
                    return Column(
                      children: [
                        const Text(
                          'Let`s start building your playlist',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const Gap(15),
                        Container(
                          width: 200,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: const Text('Add to this playlist'),
                        ),
                        const Gap(25),
                      ],
                    );
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
