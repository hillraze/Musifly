import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:musifly/core/mus.assets/export.dart';
import 'package:musifly/core/mus.assets/mus.asset_image.dart';
import 'package:musifly/presentation/providers/playlist_notifier.dart';
import 'package:musifly_client/musifly_client.dart';
import 'package:provider/provider.dart';

class MusAddTracks extends StatefulWidget {
  const MusAddTracks({
    super.key,
    required this.data,
    required this.playlist,
  });

  final List<Track> data;
  final Playlist playlist;

  @override
  _MusAddTracksState createState() => _MusAddTracksState();
}

class _MusAddTracksState extends State<MusAddTracks> {
  // Keep track of the button state
  int? _pressedTrackId;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 350,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: widget.data.length,
                        padding: const EdgeInsets.only(left: 16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisExtent: constraints.maxWidth * 0.2),
                        itemBuilder: (BuildContext context, int index) {
                          final track = widget.data[index];
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              // context.push(ScreenNames.player, extra: {'track': track});
                            },
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: track.album?.coverUrl != null
                                        ? BoxDecoration(
                                            image: DecorationImage(
                                            image: NetworkImage(
                                                track.album?.coverUrl ?? ''),
                                          ))
                                        : null,
                                  ),
                                ),
                                const Gap(4),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        track.title,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      Flexible(
                                        child: Text(
                                          track.artist?.name ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(5),
                                Consumer<PlaylistNotifier>(
                                    builder: (context, notifier, _) {
                                  return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _pressedTrackId = track.id;
                                        });

                                        notifier.addTracks(track.id ?? 1,
                                            widget.playlist.id ?? 1);

                                        // Reset the button color after 2 seconds
                                        Future.delayed(
                                            const Duration(seconds: 1), () {
                                          setState(() {
                                            _pressedTrackId = null;
                                          });
                                        });
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(8),
                                          child: _pressedTrackId == track.id
                                              ? const MusAssetImage(
                                                  MusAssets.addSongFilled)
                                              : const MusAssetImage(
                                                  MusAssets.addSong)));
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
