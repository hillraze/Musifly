import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:musifly/analytics/events/screen_names.dart';
import 'package:musifly/core/mus.assets/export.dart';
import 'package:musifly/core/mus.assets/mus.asset_image.dart';
import 'package:musifly/data/models/track/track.model.dart';
import 'package:musifly/presentation/providers/playlist_notifier.dart';
import 'package:provider/provider.dart';

class MusAddTracks extends StatelessWidget {
  const MusAddTracks({super.key, required this.data});

  final List<TrackModel> data;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child:Center(
            child: Container(
              width: double.infinity,
              height: 350,
              child: LayoutBuilder(builder: (context, constraints) {
                return GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.length,
                    padding: const EdgeInsets.only(left: 16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: constraints.maxWidth * 0.2),
                    itemBuilder: (BuildContext context, int index) {
                      final track = data[index];
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
                                decoration: track.cover != null
                                    ? BoxDecoration(
                                        image: DecorationImage(
                                        image: NetworkImage(track.cover!),
                                      ))
                                    : null,
                              ),
                            ),
                            const Gap(4),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    track.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  Flexible(
                                    child: Text(
                                      track.artist,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Spacer(),
                            const Gap(5),
                            Consumer<PlaylistNotifier>(
                              builder: (context, notifier, _) {
                                return GestureDetector(
                                  onTap: () => notifier.setPlaylistSong(track),
                                  child: const MusAssetImage(MusAssets.addSong)
                                  );
                              }
                            ),
                            const Gap(15)
                          ],
                        ),
                      );
                    });
              }),
            ),
          )
      )),

    ]);
  }
}
