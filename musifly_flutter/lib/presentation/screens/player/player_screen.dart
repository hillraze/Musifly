import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:gap/gap.dart";
import "package:go_router/go_router.dart";
import "package:musifly/analytics/events/core/extentions/context_extentions.dart";
import "package:musifly/core/core.dart";
import "package:musifly/data/models/track/track.model.dart";
import "package:musifly/presentation/providers/player_notifier.dart";
import "package:musifly/presentation/widgets/mus.player_cover.dart";
import "package:musifly/utils/show_feature_notification.dart";
import "package:provider/provider.dart";

import "../../../core/mus.assets/mus.asset_image.dart";
import "../../../core/mus.assets/mus.assets.dart";
import "../../widgets/mus.control_bar.dart";

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
    TrackModel trackModel = widget.extra['track'];
    context.read<PlayerNotifier>().setTrack(trackModel);
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
                Positioned(top: 0, child: PlayerCover(notifier: notifier)),
                const Positioned(bottom: 0, child: ControlBar()),
                // Positioned(
                //     bottom: 0,
                //     child: Container(
                //       width: 200,
                //       height: 200,
                //       color: Colors.yellow,
                //     ))
              ],
            ),
          ),
        );
      }),
    );
  }
}
