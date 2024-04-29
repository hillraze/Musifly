import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:musifly/core/mus.assets/export.dart';
import 'package:musifly/core/mus.assets/mus.asset_image.dart';
import 'package:musifly/data/models/track/track.model.dart';

class MusTracks extends StatelessWidget {
  const MusTracks({super.key, required this.data});

  final List<TrackModel> data;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 45,
                margin: const EdgeInsets.only(bottom: 15),
                // color: Colors.white,
                child: const Text('Tracks',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))),
            const Spacer(),
            Container(
                height: 45,
                margin: const EdgeInsets.only(top: 15),
                child: const Text('See More',
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(254, 255, 144, 237),
                        fontWeight: FontWeight.normal))),
          ],
        ),
      )),
      Center(
        child: Container(
          width: double.infinity,
          height: 200,
          child: LayoutBuilder(builder: (context, constraints) {
            print('${constraints.maxWidth}, ${constraints.maxHeight}');
            return GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: data.length,
                padding: const EdgeInsets.only(left: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: constraints.maxWidth * 0.6),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: data[index].cover != null
                              ? BoxDecoration(
                                  image: DecorationImage(
                                  image: NetworkImage(data[index].cover!),
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
                              data[index].title,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Flexible(
                              child: Text(
                                data[index].artist,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Spacer(),
                      const Gap(5),
                      const MusAssetImage(MusAssets.vdots),
                      const Gap(15)
                    ],
                  );
                });
          }),
        ),
      )
    ]);
  }
}
