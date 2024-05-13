import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:musifly/core/mus.assets/mus.asset_image.dart';
import 'package:musifly/core/mus.assets/mus.assets.dart';
import 'package:musifly/presentation/providers/player_notifier.dart';
import 'package:provider/provider.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({super.key});

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
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              trackShape: RectangularSliderTrackShape(),
              trackHeight: 2.0,
              thumbColor: Colors.white,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
              overlayColor: Colors.red.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            ),
            child: Container(
              width: 395,
              child: Column(
                children: [
                  Slider(
                    onChanged: (value) {
                      if (notifier.duration == null) {
                        return;
                      }
                      final position =
                          value * notifier.duration!.inMilliseconds;
                      context.read<PlayerNotifier>().seek(position);
                    },
                    value: (notifier.position != null &&
                            notifier.duration != null &&
                            notifier.position!.inMilliseconds > 0 &&
                            notifier.position!.inMilliseconds <
                                notifier.duration!.inMilliseconds)
                        ? notifier.position!.inMilliseconds /
                            notifier.duration!.inMilliseconds
                        : 0.0,
                  ),
                  Text(
                    notifier.position != null
                        ? '$notifier.positionText / $notifier.durationText'
                        : notifier.duration != null
                            ? notifier.durationText
                            : '',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer<PlayerNotifier>(
                builder: (context, playerNotifier, _) {
                  return playerNotifier.playerStatus == PlayerState.playing
                      ? IconButton(
                          key: const Key('pause_button'),
                          onPressed: () =>
                              context.read<PlayerNotifier>().pause(),
                          iconSize: 48.0,
                          icon: const MusAssetImage(MusAssets.pause),
                          color: color,
                        )
                      : IconButton(
                          key: const Key('play_button'),
                          onPressed: () =>
                              context.read<PlayerNotifier>().play(),
                          iconSize: 48.0,
                          icon: const MusAssetImage(MusAssets.play),
                          color: color,
                        );
                },
              ),
            ],
          ),
        ],
      );
    });
  }
}
