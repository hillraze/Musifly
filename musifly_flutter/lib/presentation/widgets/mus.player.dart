import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musifly/core/mus.assets/mus.asset_image.dart';
import 'package:musifly/core/mus.assets/mus.assets.dart';
import 'package:musifly/presentation/providers/player_notifier.dart';
import 'package:musifly/presentation/widgets/mus.seekbar.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Consumer<PlayerNotifier>(builder: (context, notifier, _) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          StreamBuilder<PositionData>(
              stream: notifier.positionDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return SeekBar(
                  duration: positionData?.duration ?? Duration.zero,
                  position: positionData?.position ?? Duration.zero,
                  bufferedPosition:
                      positionData?.bufferedPosition ?? Duration.zero,
                  onChangeEnd: notifier.player.seek,
                );
              }),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              StreamBuilder<PlayerState>(
                stream: notifier.player.playerStateStream,
                builder: (context, snapshot) {
                  final playerState = snapshot.data;
                  final processingState = playerState?.processingState;
                  final playing = playerState?.playing;
                  if (processingState == ProcessingState.loading ||
                      processingState == ProcessingState.buffering) {
                    return Skeletonizer(
                      child: IconButton(
                        icon: Icon(Icons.play_arrow),
                        iconSize: 64.0,
                        onPressed: () => null,
                      ),
                    );
                  } else if (playing != true) {
                    return IconButton(
                      icon: const MusAssetImage(MusAssets.play),
                      iconSize: 64.0,
                      onPressed: notifier.player.play,
                    );
                  } else if (processingState != ProcessingState.completed) {
                    return IconButton(
                      icon: const MusAssetImage(MusAssets.pause),
                      iconSize: 64.0,
                      onPressed: notifier.player.pause,
                    );
                  } else {
                    return IconButton(
                      icon: const Icon(Icons.replay),
                      iconSize: 64.0,
                      onPressed: () => notifier.player.seek(Duration.zero),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      );
    });
  }
}
