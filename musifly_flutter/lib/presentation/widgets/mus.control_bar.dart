import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:musifly/analytics/events/core/extentions/context_extentions.dart';
import 'package:musifly/core/mus.assets/mus.assets.dart';
import 'package:musifly/presentation/providers/player_notifier.dart';
import 'package:musifly/presentation/widgets/mus.player.dart';
import 'package:provider/provider.dart';

import '../../core/mus.assets/mus.asset_image.dart';

class ControlBar extends StatefulWidget {
  const ControlBar({super.key});

  @override
  State<ControlBar> createState() => _ControlBarState();
}

class _ControlBarState extends State<ControlBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        color: Color(0xFF1A2447),
      ),
      width: context.mediaQuery.size.width,
      height: 361,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Center(
                child: SizedBox(
                  height: 57,
                  // width: 327,

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<PlayerNotifier>(builder: (context, notifier, _) {
                        if (notifier.track == null) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  notifier.track!.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Gap(3),
                              Flexible(
                                child: Text(notifier.track!.artist,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                              ),
                            ],
                          ),
                        );
                      }),
                      Spacer(),
                      MusAssetImage(MusAssets.favouritesFilled)
                    ],
                  ),
                ),
              ),
            ),
            Gap(35),
            PlayerWidget()
          ],
        ),
      ),
    );
  }
}
