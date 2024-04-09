import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:gap/gap.dart";
import "package:musifly/core/mus.assets/export.dart";

class MusAlbum extends StatelessWidget {
  const MusAlbum({super.key});

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 45,
                  margin: const EdgeInsets.only(bottom: 15),
                  // color: Colors.white,
                  child: const Text('Albums',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
              // Spacer(),
              Container(
                  // width: 341,
                  height: 45,
                  // color: Colors.white,

                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('See More',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(254, 255, 144, 237),
                          fontWeight: FontWeight.normal))),
            ],
          ),
        ),
        Center(
            child: Container(
          width: double.infinity,
          height: 194,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            children: <Widget>[
              Column(
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(MusAssets.mockCover.path),
                      ),
                    ),
                  ),
                  Container(
                    child: const Text('Chained To The Rhythm',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                  Container(
                    child: const Text('Katy Perry',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ),
                ],
              ),
              const Gap(10),
              Column(
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(MusAssets.mockCover.path),
                    )),
                  ),
                  Container(
                    child: const Text('Chained To The Rhythm',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                  Container(
                    child: const Text('Katy Perry',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ),
                ],
              ),
              const Gap(10),
              Column(
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(MusAssets.mockCover.path),
                    )),
                  ),
                  Container(
                    child: const Text('Chained To The Rhythm',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                  Container(
                    child: const Text('Katy Perry',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ),
                ],
              ),
              const Gap(10),
              Column(
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(MusAssets.mockCover.path),
                    )),
                  ),
                  Container(
                    child: const Text('Chained To The Rhythm',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                  Container(
                    child: const Text('Katy Perry',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ),
                ],
              ),
              const Gap(10),
              Column(
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(MusAssets.mockCover.path),
                    )),
                  ),
                  Container(
                    child: const Text('Chained To The Rhythm',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                  Container(
                    child: const Text('Katy Perry',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ),
                ],
              ),
            ],
          ),
        )),
      ],
    );
  }
}
