import "dart:ui";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/painting.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";
import "package:gap/gap.dart";
import "package:go_router/go_router.dart";
import "package:musifly/analytics/events/core/extentions/context_extentions.dart";
import "package:musifly/analytics/events/screen_names.dart";
import "package:musifly/core/mus.assets/mus.asset_image.dart";
import "package:musifly/core/mus.assets/mus.assets.dart";
import "package:musifly/presentation/providers/playlist_notifier.dart";
import "package:musifly/utils/show_feature_notification.dart";
import "package:provider/provider.dart";


class PlaylistCreate extends StatefulWidget {
   @override
  _PlaylistCreateState createState() => _PlaylistCreateState();
}

class _PlaylistCreateState extends State<PlaylistCreate> {
  // Create a TextEditingController

  final TextEditingController _controller = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF192352),
      appBar: AppBar(
      backgroundColor: const Color(0xFF192352),
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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Playlist creation',
                style: TextStyle(
                    shadows: [
                      Shadow(
                          color: Color.fromARGB(130, 0, 0, 0),
                          blurRadius: 10,
                          offset: Offset(0, 1))
                    ],
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22)), Gap(50)],
        ),
        
        ),
        
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
          
            width: double.infinity,
            height: 500,
            
            decoration: const BoxDecoration(borderRadius:BorderRadius.all(Radius.circular(20)), color: Color.fromARGB(255, 222, 45, 251)),
            child:  Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
                const Text('Give your playlist a name',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight:FontWeight.bold),
                ),
                const Gap(25),
                SizedBox(
                width: 250,
                child: TextField(
                controller: _controller,
                decoration: const InputDecoration(hintText: 'My playlist',
                hintStyle: TextStyle(color: Color.fromARGB(255, 190, 195, 197))),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),)),
                const Gap(25),
          
                Consumer<PlaylistNotifier>(
                  builder: (context, notifier, _) {
                    return GestureDetector(
                      onTap: () {
                        final String playlistName = _controller.text;
                        notifier.setPlaylistName(playlistName);
                        context.pushReplacement(ScreenNames.playlist);
                        

                       },
                      child: Container(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: context.colorScheme.onSecondary,borderRadius: const BorderRadius.all(Radius.circular(25))),
                        child: const Text('Create'),
                      ),
                    );
                  }
                )
          
          
            ],)
          ),
        ],
      ),
    );
  }
}
