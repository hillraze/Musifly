import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:go_router/go_router.dart";
import "package:musifly/core/core.dart";
import "package:musifly/core/mus.assets/mus.asset_image.dart";
import "package:musifly/core/mus.assets/mus.assets.dart";
import "package:musifly/presentation/screens/playlist/playlist_notifier.dart";
import "package:musifly/presentation/widgets/mus.add_tracks.dart";
import "package:musifly/presentation/widgets/mus.playlist_tracks.dart";
import "package:musifly/utils/show_feature_notification.dart";
import "package:musifly_client/musifly_client.dart";
import "package:provider/provider.dart";

class PlaylistScreen extends StatefulWidget {
  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  final TextEditingController _searchController = TextEditingController();
  bool get _isSearchEmpty => _searchController.text.isEmpty;

  List<Track> _filteredTracks = [];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    _searchController.addListener(_filterTracks);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PlaylistNotifier>().getNewTracks();
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _searchController.removeListener(_filterTracks);
    _searchController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _filterTracks() {
    final query = _searchController.text.toLowerCase();
    final tracks = context.read<PlaylistNotifier>().tracks;
    setState(() {
      if (query.isEmpty) {
        _filteredTracks = [];
      } else {
        _filteredTracks = tracks
            .where((track) => track.title.toLowerCase().contains(query))
            .toList();
      }
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
                    Consumer<PlaylistNotifier>(builder: (context, notifier, _) {
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
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(
                        'hillraze',
                        style: TextStyle(
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
                    ),
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                                      topRight: Radius.circular(25),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      const Gap(10),
                                      const Text(
                                        'Add to this playlist',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Gap(10),
                                      SizedBox(
                                        width: 350,
                                        height: 50,
                                        child: TextField(
                                          focusNode: _focusNode,
                                          controller: _searchController,
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
                                                        MusAssets.loop),
                                                  ),
                                            hintText: 'Search',
                                            hintStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: _isFocused
                                                  ? Colors.grey
                                                  : Colors.white,
                                            ),
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
                                          color:
                                              Color.fromARGB(255, 63, 63, 63),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          children: [
                                            if (_isSearchEmpty)
                                              const Center(
                                                child: Text(
                                                  "Add your first track",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              )
                                            else
                                              MusAddTracks(
                                                data: _filteredTracks,
                                                playlist:
                                                    notifier.currentPlaylist!,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            child: Container(
                              width: 200,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
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
                                      topRight: Radius.circular(25),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      const Gap(10),
                                      const Text(
                                        'Add to this playlist',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Gap(10),
                                      SizedBox(
                                        width: 350,
                                        height: 50,
                                        child: TextField(
                                          focusNode: _focusNode,
                                          controller: _searchController,
                                          onChanged: (value) {
                                            _filterTracks();
                                          },
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
                                            prefixIcon: _searchController
                                                    .text.isEmpty
                                                ? const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 110, right: 5),
                                                    child: MusAssetImage(
                                                        MusAssets.loop),
                                                  )
                                                : null,
                                            hintText: 'Search',
                                            hintStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: _isFocused
                                                  ? Colors.grey
                                                  : Colors.white,
                                            ),
                                            contentPadding: _isFocused ||
                                                    _searchController
                                                        .text.isNotEmpty
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
                                          color:
                                              Color.fromARGB(255, 63, 63, 63),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          children: [
                                            // if (_isSearchEmpty)
                                            //   const Center(
                                            //     child: Text(
                                            //       "Add your tracks",
                                            //       style: TextStyle(
                                            //           color: Colors.white,
                                            //           fontSize: 18),
                                            //     ),
                                            //   )
                                            // else
                                            if (_searchController
                                                    .text.isNotEmpty &&
                                                _filteredTracks.isEmpty)
                                              const Center(
                                                child: Text(
                                                  "Can't find tracks",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              )
                                            else
                                              MusAddTracks(
                                                data: _filteredTracks,
                                                playlist:
                                                    notifier.currentPlaylist!,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
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
                        child: Text(
                          'ELSE ERROR',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      );
                    }
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
