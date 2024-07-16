import 'package:flutter/material.dart';
import 'package:musifly/analytics/events/core/extentions/context_extentions.dart';

class PlayerCover extends StatelessWidget {
  PlayerCover({super.key});
  // required this.cover
  // String cover;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Image.network(
      'https://static.mp3xa.me/album_images/400x400/tyla-tyla.jpg',
      fit: BoxFit.contain,
      height: context.mediaQuery.size.height * 0.7,
    );
    // Container(
    //     height: context.mediaQuery.size.height,
    //     width: context.mediaQuery.size.width,
    //     decoration: BoxDecoration(
    //         image: DecorationImage(
    //             fit: BoxFit.contain, image: NetworkImage(cover))));
  }
}
