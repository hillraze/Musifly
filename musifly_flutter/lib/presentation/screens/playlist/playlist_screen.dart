import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:go_router/go_router.dart";
import "package:musifly/core/core.dart";
import "package:musifly/core/mus.assets/mus.asset_image.dart";
import "package:musifly/core/mus.assets/mus.assets.dart";
import "package:musifly/presentation/providers/playlist_notifier.dart";
import "package:musifly/presentation/widgets/mus.add_tracks.dart";
import "package:musifly/presentation/widgets/mus.playlist_tracks.dart";
import "package:musifly/utils/show_feature_notification.dart";
import "package:provider/provider.dart";

class PlaylistScreen extends StatefulWidget {
  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PlaylistNotifier>().getNewTracks();
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

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
                        offset: Offset(0, 1))
                  ]),
                  child: const MusAssetImage(
                    MusAssets.back,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          )),
      body: Consumer<PlaylistNotifier>(builder: (context, notifier, _) {
        // final playlistName = notifier.getPlaylistName();
        // print(playlistName);
        return Column(
          children: [
            Center(
              child: Container(
                  width: double.infinity,
                  height: 450,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(MusAssets.noteCover.path),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<PlaylistNotifier>(
                          builder: (context, notifier, _) {
                        if (notifier.currentPlaylist == null) {
                          return const CircularProgressIndicator();
                        }
                        final playlist = notifier.currentPlaylist!;
                        return Container(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              playlist.name,
                              style: const TextStyle(
                                  shadows: [
                                    Shadow(
                                        color: Color.fromARGB(130, 0, 0, 0),
                                        blurRadius: 10,
                                        offset: Offset(0, 1))
                                  ],
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ));
                      }),
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: const Text('hillraze',
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                      color: Color.fromARGB(130, 0, 0, 0),
                                      blurRadius: 10,
                                      offset: Offset(0, 1))
                                ],
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: const Row(
                          children: [
                            MusAssetImage(MusAssets.planet),
                            Gap(15),
                            Text('0min',
                                style: TextStyle(
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        color: Color.fromARGB(130, 0, 0, 0),
                                        blurRadius: 10,
                                        offset: Offset(0, 1))
                                  ],
                                )),
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
                              )),
                          const Gap(25),
                          GestureDetector(
                              onTap: () => showFeatureNotification(context),
                              child: const MusAssetImage(
                                MusAssets.share,
                                height: 30,
                              )),
                          const Gap(25),
                          GestureDetector(
                              onTap: () => showFeatureNotification(context),
                              child: const MusAssetImage(
                                MusAssets.vdots,
                                height: 25,
                              )),
                        ],
                      ),
                      const Gap(15)
                    ],
                  )),
            ),
            SizedBox(
              width: double.infinity,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<PlaylistNotifier>(builder: (context, notifier, _) {
                    if (notifier.currentPlaylist == null) {
                      return const CircularProgressIndicator();
                    }
                    final playlistTracks =
                        notifier.currentPlaylist!.playlistTracks!;
                    if (playlistTracks.isEmpty) {
                      return Column(
                        children: [
                          const Text(
                            'Let`s start building your playlist',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          const Gap(15),
                          GestureDetector(
                            onTap: () => showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 2000,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 31, 31, 31),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25))),
                                    child: Column(
                                      children: [
                                        const Gap(10),
                                        const Text('Add to this playlist',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        const Gap(10),
                                        SizedBox(
                                          width: 350,
                                          height: 50,
                                          child: TextField(
                                            focusNode: _focusNode,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: const Color.fromARGB(
                                                  255, 63, 63, 63),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              prefixIcon: _isFocused
                                                  ? null
                                                  : const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 110, right: 5),
                                                      child: MusAssetImage(
                                                          MusAssets.loop)),
                                              hintText: 'Search',
                                              hintStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: _isFocused
                                                      ? Colors.grey
                                                      : Colors.white),
                                              contentPadding: _isFocused
                                                  ? const EdgeInsets.only(
                                                      left: 10)
                                                  : const EdgeInsets.symmetric(
                                                      horizontal: 135),
                                              alignLabelWithHint: true,
                                            ),
                                          ),
                                        ),
                                        const Gap(15),
                                        Container(
                                          width: 350,
                                          height: 350,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 63, 63, 63),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Column(
                                            children: [
                                              Consumer<PlaylistNotifier>(
                                                  builder:
                                                      (context, state, child) {
                                                if (state.tracks.isEmpty) {
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }

                                                return MusAddTracks(
                                                  data: state.tracks,
                                                  playlist:
                                                      state.currentPlaylist!,
                                                );
                                              })
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                            child: Container(
                              width: 200,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: const Text('Add to this playlist'),
                            ),
                          ),
                          const Gap(25),
                        ],
                      );
                    } else if (playlistTracks.isNotEmpty) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () => showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 2000,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 31, 31, 31),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25))),
                                    child: Column(
                                      children: [
                                        const Gap(10),
                                        const Text('Add to this playlist',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        const Gap(10),
                                        SizedBox(
                                          width: 350,
                                          height: 50,
                                          child: TextField(
                                            focusNode: _focusNode,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: const Color.fromARGB(
                                                  255, 63, 63, 63),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              prefixIcon: _isFocused
                                                  ? null
                                                  : const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 110, right: 5),
                                                      child: MusAssetImage(
                                                          MusAssets.loop)),
                                              hintText: 'Search',
                                              hintStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: _isFocused
                                                      ? Colors.grey
                                                      : Colors.white),
                                              contentPadding: _isFocused
                                                  ? const EdgeInsets.only(
                                                      left: 10)
                                                  : const EdgeInsets.symmetric(
                                                      horizontal: 135),
                                              alignLabelWithHint: true,
                                            ),
                                          ),
                                        ),
                                        const Gap(15),
                                        Container(
                                          width: 350,
                                          height: 350,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 63, 63, 63),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Column(
                                            children: [
                                              Consumer<PlaylistNotifier>(
                                                  builder:
                                                      (context, state, child) {
                                                if (state.tracks.isEmpty) {
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }

                                                return MusAddTracks(
                                                  data: state.tracks,
                                                  playlist:
                                                      state.currentPlaylist!,
                                                );
                                              })
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                            child: SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: const SizedBox(
                                        height: 60,
                                        width: 60,
                                        child: MusAssetImage(
                                          MusAssets.addPlaylist,
                                        ),
                                      ),
                                    ),
                                    const Gap(7),
                                    const Expanded(
                                      child: Text(
                                        'Add to this playlist',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    // const Gap(5),
                                    // Icon(Icons.add, color: Colors.white),
                                    // const Gap(15)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          PlaylistTracks(data: playlistTracks),
                        ],
                      );
                    } else {
                      return const SizedBox(
                          width: 100,
                          height: 100,
                          child: Text('ELSE ERROR',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white)));
                    }
                  }),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
