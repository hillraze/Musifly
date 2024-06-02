import 'package:flutter/material.dart';
import 'package:musifly/analytics/events/core/extentions/context_extentions.dart';
import 'package:musifly/presentation/providers/player_notifier.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PlayerCover extends StatelessWidget {
  PlayerCover({super.key, required this.notifier});
  PlayerNotifier notifier;
  // required this.cover
  // String cover;

  @override
  Widget build(
    BuildContext context,
  ) {
    if (notifier.track!.audioLink == Null) {
      return Skeletonizer(
          containersColor: Colors.grey,
          child: Image.network(
            notifier.track!.cover,
            fit: BoxFit.contain,
            height: context.mediaQuery.size.height * 0.7,
          ));
    } else
      return Image.network(
        notifier.track!.cover,
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
