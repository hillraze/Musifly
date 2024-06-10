import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:go_router/go_router.dart";
import "package:musifly/analytics/events/screen_names.dart";
import "package:musifly/core/mus.assets/export.dart";
import "package:musifly/core/mus.assets/mus.asset_image.dart";
import "package:musifly/core/mus.assets/mus.assets.dart";

import "../../widgets/mus.app_bar.dart";

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF192352),
      appBar: const MusAppBar(),
      body: Container(
        padding: EdgeInsets.only(top: 25),
        
        child: GestureDetector(
          onTap: ()=> context.push(ScreenNames.playlistCreate),
          child: Row(
            children: [
              Container(
                height: 75,
                width: 100,
                child: MusAssetImage(MusAssets.addPlaylist),
              
              ),
              Text('Create new playlist', style: TextStyle(color: Colors.white, fontSize: 18))
            ],
          ),
        ),
      ),
    );
  }
}
