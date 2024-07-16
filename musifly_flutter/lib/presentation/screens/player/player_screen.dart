import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:musifly/core/core.dart';
import 'package:musifly/presentation/screens/player/player_notifier.dart';
import 'package:musifly/presentation/widgets/mus.player_cover.dart';
import 'package:musifly/presentation/widgets/mus.seekbar.dart';
import 'package:musifly/utils/show_feature_notification.dart';
import 'package:provider/provider.dart';

import '../../../core/mus.assets/mus.asset_image.dart';
import '../../../core/mus.assets/mus.assets.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
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
        return StreamBuilder<MediaItem?>(
          stream: notifier.currentTrackStream,
          builder: (context, snapshot) {
            final mediaItem = snapshot.data;
            if (mediaItem == null) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(top: 0, child: PlayerCover()),
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
                          width: MediaQuery.of(context).size.width,
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
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    '',
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
                                                  child: Text('',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                              onTap: () =>
                                                  showFeatureNotification(
                                                      context),
                                              child: const MusAssetImage(
                                                MusAssets.favouritesFilled,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(35),
                                StreamBuilder<PlaybackState>(
                                  stream: notifier.playbackStateStream,
                                  builder: (context, snapshot) {
                                    final playbackState = snapshot.data;
                                    final processingState =
                                        playbackState?.processingState;
                                    final playing = playbackState?.playing;

                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        if (playbackState != null)
                                          // ListenableBuilder(
                                          //     listenable: notifier,
                                          //     builder: (context, _) {
                                          //       // return SeekBar(
                                          //       //   duration:  ??
                                          //       //       Duration.zero,
                                          //       //   position:
                                          //       //       notifier.currentPosition,
                                          //       //   bufferedPosition: playbackState
                                          //       //       .bufferedPosition,
                                          //       //   onChangeEnd:
                                          //       //       notifier.audioHandler.seek,
                                          //       // );
                                          //     }),
                                          const Gap(35),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: const MusAssetImage(
                                                  MusAssets.repeat),
                                              iconSize: 64.0,
                                              onPressed: () =>
                                                  showFeatureNotification(
                                                      context),
                                            ),
                                            IconButton(
                                              onPressed:
                                                  notifier.skipToPreviousTrack,
                                              icon: const MusAssetImage(
                                                  MusAssets.backward),
                                              iconSize: 64.0,
                                            ),
                                            if (processingState ==
                                                    AudioProcessingState
                                                        .loading ||
                                                processingState ==
                                                    AudioProcessingState
                                                        .buffering)
                                              const IconButton(
                                                icon: MusAssetImage(
                                                    MusAssets.playLoading),
                                                iconSize: 64.0,
                                                onPressed: null,
                                              )
                                            else if (playing != true)
                                              IconButton(
                                                icon: const MusAssetImage(
                                                    MusAssets.play),
                                                iconSize: 64.0,
                                                onPressed: notifier.playTrack,
                                              )
                                            else
                                              IconButton(
                                                icon: const MusAssetImage(
                                                    MusAssets.pause),
                                                iconSize: 64.0,
                                                onPressed: notifier.pauseTrack,
                                              ),
                                            IconButton(
                                                onPressed:
                                                    notifier.skipToNextTrack,
                                                icon: const MusAssetImage(
                                                    MusAssets.forward),
                                                iconSize: 64.0),
                                            IconButton(
                                                onPressed: () =>
                                                    showFeatureNotification(
                                                        context),
                                                icon: const MusAssetImage(
                                                    MusAssets.shuffle))
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(top: 0, child: PlayerCover()),
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
                        width: MediaQuery.of(context).size.width,
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
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  mediaItem.title,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              const Gap(3),
                                              Flexible(
                                                child: Text(
                                                    mediaItem.artist ?? '',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                            onTap: () =>
                                                showFeatureNotification(
                                                    context),
                                            child: const MusAssetImage(
                                              MusAssets.favouritesFilled,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(35),
                              StreamBuilder<PlaybackState>(
                                stream: notifier.playbackStateStream,
                                builder: (context, snapshot) {
                                  final playbackState = snapshot.data;
                                  final processingState =
                                      playbackState?.processingState;
                                  final playing = playbackState?.playing;

                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      if (playbackState != null)
                                        ListenableBuilder(
                                            listenable: notifier,
                                            builder: (context, _) {
                                              return SeekBar(
                                                duration: mediaItem.duration ??
                                                    Duration.zero,
                                                position:
                                                    notifier.currentPosition,
                                                bufferedPosition: playbackState
                                                    .bufferedPosition,
                                                onChangeEnd:
                                                    notifier.audioHandler.seek,
                                              );
                                            }),
                                      const Gap(35),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: const MusAssetImage(
                                                MusAssets.repeat),
                                            iconSize: 64.0,
                                            onPressed: () =>
                                                showFeatureNotification(
                                                    context),
                                          ),
                                          IconButton(
                                            onPressed:
                                                notifier.skipToPreviousTrack,
                                            icon: const MusAssetImage(
                                                MusAssets.backward),
                                            iconSize: 64.0,
                                          ),
                                          if (processingState ==
                                                  AudioProcessingState
                                                      .loading ||
                                              processingState ==
                                                  AudioProcessingState
                                                      .buffering)
                                            const IconButton(
                                              icon: MusAssetImage(
                                                  MusAssets.playLoading),
                                              iconSize: 64.0,
                                              onPressed: null,
                                            )
                                          else if (playing != true)
                                            IconButton(
                                              icon: const MusAssetImage(
                                                  MusAssets.play),
                                              iconSize: 64.0,
                                              onPressed: notifier.playTrack,
                                            )
                                          else
                                            IconButton(
                                              icon: const MusAssetImage(
                                                  MusAssets.pause),
                                              iconSize: 64.0,
                                              onPressed: notifier.pauseTrack,
                                            ),
                                          IconButton(
                                              onPressed:
                                                  notifier.skipToNextTrack,
                                              icon: const MusAssetImage(
                                                  MusAssets.forward),
                                              iconSize: 64.0),
                                          IconButton(
                                              onPressed: () =>
                                                  showFeatureNotification(
                                                      context),
                                              icon: const MusAssetImage(
                                                  MusAssets.shuffle))
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
