import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:go_router/go_router.dart";
import "package:just_audio/just_audio.dart";
import "package:musifly/analytics/events/core/extentions/context_extentions.dart";
import "package:musifly/core/core.dart";
import "package:musifly/presentation/screens/player/player_notifier.dart";
import "package:musifly/presentation/widgets/mus.player_cover.dart";
import "package:musifly/presentation/widgets/mus.seekbar.dart";
import "package:musifly/utils/show_feature_notification.dart";
import "package:musifly_client/musifly_client.dart";
import "package:provider/provider.dart";

import "../../../core/mus.assets/mus.asset_image.dart";
import "../../../core/mus.assets/mus.assets.dart";

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({required this.extra, super.key});
  final Map<String, dynamic> extra;

  @override
  State<StatefulWidget> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  void initState() {
    super.initState();
    Track track = widget.extra['track'];
    List<PlaylistTrack> playlistTracks = widget.extra['tracks'];
    context.read<PlayerNotifier>().setTrackList(playlistTracks, track);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      // backgroundColor: const Color(0xFF192352),
      appBar: AppBar(
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
        ),
        // backgroundColor: const Color(0xFF192352),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text('Now playing',
                style: TextStyle(
                    shadows: [
                      Shadow(
                          color: Color.fromARGB(130, 0, 0, 0),
                          blurRadius: 10,
                          offset: Offset(0, 1))
                    ],
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22)),
            const Gap(100),
            GestureDetector(
              onTap: () => showFeatureNotification(context),
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(85, 0, 0, 0),
                      blurRadius: 1,
                      offset: Offset(0, 1))
                ]),
                child: const MusAssetImage(
                  MusAssets.vdots,
                  width: 5,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<PlayerNotifier>(builder: (context, notifier, _) {
        if (notifier.track == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
          // color: Colors.red,
          height: context.mediaQuery.size.height,
          width: context.mediaQuery.size.width,
          child: Center(
            child: Stack(
              // fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                // MusAssetImage(MusAssets.playerBackground, fit: BoxFit.fill),

                //COVER:
                Positioned(top: 0, child: PlayerCover(notifier: notifier)),

                // CONTROL BAR:
                Positioned(
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        color: Color(0xFF1A2447),
                      ),
                      width: context.mediaQuery.size.width,
                      height: 361,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 30, left: 20, right: 20),
                              child: Center(
                                child: SizedBox(
                                  height: 57,
                                  // width: 327,

                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Consumer<PlayerNotifier>(
                                          builder: (context, notifier, _) {
                                        if (notifier.track == null) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        return Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  notifier.track!.title,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Gap(3),
                                              Flexible(
                                                child: Text(
                                                    notifier.track?.artist
                                                            ?.name ??
                                                        '',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white)),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                      Spacer(),
                                      GestureDetector(
                                          onTap: () =>
                                              showFeatureNotification(context),
                                          child: MusAssetImage(
                                            MusAssets.favouritesFilled,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Gap(35),

                            //PLAYER CONTROLS:
                            Consumer<PlayerNotifier>(
                                builder: (context, notifier, _) {
                              // final color = Theme.of(context).primaryColor;
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  StreamBuilder<PositionData>(
                                      stream: notifier.positionDataStream,
                                      builder: (context, snapshot) {
                                        final positionData = snapshot.data;
                                        return SeekBar(
                                          duration: positionData?.duration ??
                                              Duration.zero,
                                          position: positionData?.position ??
                                              Duration.zero,
                                          bufferedPosition:
                                              positionData?.bufferedPosition ??
                                                  Duration.zero,
                                          onChangeEnd: notifier.player.seek,
                                        );
                                      }),
                                  Gap(35),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: MusAssetImage(MusAssets.repeat),
                                        iconSize: 64.0,
                                        onPressed: () =>
                                            showFeatureNotification(context),
                                      ),
                                      IconButton(
                                        onPressed: () =>
                                            // showFeatureNotification(context),
                                            context
                                                .read<PlayerNotifier>()
                                                .skipToPreviousTrack(),
                                        icon: MusAssetImage(MusAssets.backward),
                                        iconSize: 64.0,
                                      ),
                                      StreamBuilder<PlayerState>(
                                        stream:
                                            notifier.player.playerStateStream,
                                        builder: (context, snapshot) {
                                          final playerState = snapshot.data;
                                          final processingState =
                                              playerState?.processingState;
                                          final playing = playerState?.playing;

                                          if (processingState ==
                                              ProcessingState.completed) {
                                            notifier.player.seek(Duration.zero);
                                            notifier.player.play();
                                          }

                                          if (processingState ==
                                                  ProcessingState.loading ||
                                              processingState ==
                                                  ProcessingState.buffering) {
                                            return IconButton(
                                              icon: const MusAssetImage(
                                                  MusAssets.playLoading),
                                              iconSize: 64.0,
                                              onPressed: () => null,
                                            );
                                          } else if (playing != true) {
                                            return IconButton(
                                              icon: const MusAssetImage(
                                                  MusAssets.play),
                                              iconSize: 64.0,
                                              onPressed: notifier.playTrack,
                                            );
                                          } else {
                                            return IconButton(
                                              icon: const MusAssetImage(
                                                  MusAssets.pause),
                                              iconSize: 64.0,
                                              onPressed: notifier.pauseTrack,
                                            );
                                          }
                                        },
                                      ),
                                      IconButton(
                                          onPressed: () =>
                                              // showFeatureNotification(context),
                                              context
                                                  .read<PlayerNotifier>()
                                                  .skipToNextTrack(),
                                          icon:
                                              MusAssetImage(MusAssets.forward),
                                          iconSize: 64.0),
                                      IconButton(
                                          onPressed: () =>
                                              showFeatureNotification(context),
                                          icon:
                                              MusAssetImage(MusAssets.shuffle))
                                    ],
                                  ),
                                ],
                              );
                            })
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        );
      }),
    );
  }
}
