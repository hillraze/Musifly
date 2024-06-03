import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musifly/core/mus.assets/mus.asset.dart';
import 'package:musifly/core/mus.assets/mus.asset_image.dart';
import 'package:musifly/core/mus.assets/mus.assets.dart';
import 'package:musifly/presentation/providers/player_notifier.dart';
import 'package:musifly/presentation/widgets/mus.seekbar.dart';
import 'package:musifly/utils/show_feature_notification.dart';
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
          Gap(35),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: MusAssetImage(MusAssets.repeat),
                iconSize: 64.0,
                onPressed: () => showFeatureNotification(context),
              ),
              IconButton(
                onPressed: () => showFeatureNotification(context),
                icon: MusAssetImage(MusAssets.backward),
                iconSize: 64.0,
              ),
              StreamBuilder<PlayerState>(
                stream: notifier.player.playerStateStream,
                builder: (context, snapshot) {
                  final playerState = snapshot.data;
                  final processingState = playerState?.processingState;
                  final playing = playerState?.playing;

                  if (processingState == ProcessingState.completed) {
                    notifier.player.seek(Duration.zero);
                    notifier.player.play();
                  }

                  if (processingState == ProcessingState.loading ||
                      processingState == ProcessingState.buffering) {
                    return IconButton(
                      icon: const MusAssetImage(MusAssets.playLoading),
                      iconSize: 64.0,
                      onPressed: () => null,
                    );
                  } else if (playing != true) {
                    return IconButton(
                      icon: const MusAssetImage(MusAssets.play),
                      iconSize: 64.0,
                      onPressed: notifier.playTrack,
                    );
                  } else {
                    return IconButton(
                      icon: const MusAssetImage(MusAssets.pause),
                      iconSize: 64.0,
                      onPressed: notifier.pauseTrack,
                    );
                  }
                },
              ),
              IconButton(
                  onPressed: () => showFeatureNotification(context),
                  icon: MusAssetImage(MusAssets.forward),
                  iconSize: 64.0),
              IconButton(
                  onPressed: () => showFeatureNotification(context),
                  icon: MusAssetImage(MusAssets.shuffle))
            ],
          ),
        ],
      );
    });
  }
}
