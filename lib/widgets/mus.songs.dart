import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:musifly/core/mus.assets/export.dart';
import 'package:musifly/core/mus.assets/mus.asset_image.dart';

class MusSongs extends StatelessWidget {
  const MusSongs({super.key});

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
                child: const Text('Songs',
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
                itemCount: 12,
                padding: const EdgeInsets.only(left: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: constraints.maxWidth * 0.6),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      ClipRRect(
                        child: const MusAssetImage(MusAssets.mockCover,
                            height: 50),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      Gap(4),
                      const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chained to the Rhytm ',
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Flexible(
                              child: Text(
                                'Katty Perry',
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Spacer(),
                      Gap(5),
                      const MusAssetImage(MusAssets.vdots),
                      Gap(15)
                    ],
                  );
                });
          }),
        ),
      )
    ]);
  }
}
