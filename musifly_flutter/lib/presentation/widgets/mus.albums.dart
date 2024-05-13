import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

import "../../data/models/album/album.model.dart";

class MusAlbum extends StatelessWidget {
  const MusAlbum({super.key, required this.data});

  final List<AlbumModel> data;

  @override
  Widget build(BuildContext context) {
    print(data);

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
          child: SizedBox(
              width: double.infinity,
              height: 194,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                itemCount: data.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      height: 160,
                      width: 160,
                      decoration: data[index].cover != null
                          ? BoxDecoration(
                              image: DecorationImage(
                              image: NetworkImage(data[index].cover!),
                            ))
                          : null,
                    ),
                    Text(data[index].title,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white)),
                    Text(data[index].artist,
                        style:
                            const TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
