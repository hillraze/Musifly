import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:musifly/analytics/events/screen_names.dart';
import 'package:musifly/core/core.dart';
import 'package:musifly/core/mus.assets/mus.asset_image.dart';
import 'package:musifly/presentation/screens/player/player_notifier.dart';
import 'package:musifly/presentation/screens/search/search_notifier.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    final notifier = context.read<SearchNotifier>();
    notifier.getNewTracks();
    notifier.getNewAlbums();
    notifier.getNewArtists();

    _searchController.addListener(() {
      final text = _searchController.text;
      setState(() {
        _isSearching = text.isNotEmpty;
      });
      notifier.filterSearchResults(text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF192352),
      body: Padding(
        padding: const EdgeInsets.only(top: 46),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 335,
                  height: 46,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      suffixIcon: const Icon(Icons.search, color: Colors.grey),
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                      ),
                      fillColor: const Color(0xFF192352),
                      // Dark fill color to match the image
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 20.0),
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.purple,
                  ),
                ),
              ],
            ),
            Consumer<PlayerNotifier>(builder: (context, notifier, _) {
              return Expanded(
                child:
                    Consumer<SearchNotifier>(builder: (context, notifier, _) {
                  return _isSearching
                      ? ListView(
                          children: [
                            if (notifier.tracks.isNotEmpty) ...[
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Tracks',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              ...notifier.tracks.map((track) => GestureDetector(
                                    onTap: () {
                                      context
                                          .read<PlayerNotifier>()
                                          .setTrack(track);
                                      context.push(ScreenNames.player);
                                    },
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.only(left: 10),
                                      leading: const MusAssetImage(
                                        MusAssets.defaultCover,
                                        width: 60,
                                      ),
                                      title: Text(track.title,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                      subtitle: const Text(
                                        'Artist name',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                    ),
                                  )),
                            ],
                            if (notifier.albums.isNotEmpty) ...[
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Albums',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              ...notifier.albums.map((album) => GestureDetector(
                                    onTap: () => {
                                      context.push(ScreenNames.album),
                                      context
                                          .read<SearchNotifier>()
                                          .setAlbum(album)
                                    },
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.only(
                                          bottom: 10, left: 10),
                                      leading: Image(
                                          image: NetworkImage(album.coverUrl!)),
                                      title: Text(album.title,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                      subtitle: Text(
                                        album.artist!.name,
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                    ),
                                  )),
                            ],
                            if (notifier.artists.isNotEmpty) ...[
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Artists',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              ...notifier.artists
                                  .map((artist) => GestureDetector(
                                        onTap: () => {
                                          context.push(ScreenNames.artist),
                                          context
                                              .read<SearchNotifier>()
                                              .setArtist(artist)
                                        },
                                        child: ListTile(
                                          contentPadding: const EdgeInsets.only(
                                              bottom: 10, left: 10),
                                          leading: const MusAssetImage(
                                            MusAssets.defaultCover,
                                            width: 60,
                                          ),
                                          title: Text(artist.name,
                                              style: const TextStyle(
                                                  color: Colors.white)),
                                          subtitle: Text(
                                            artist.bio,
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                        ),
                                      )),
                            ],
                          ],
                        )
                      : const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Listen to what you like',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                'search for artists, songs, albums, etc.',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              )
                            ],
                          ),
                        );
                }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
