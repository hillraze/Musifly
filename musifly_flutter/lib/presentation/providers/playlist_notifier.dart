import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:musifly/analytics/mus.logger.dart';
import 'package:musifly/data/data_sources/api/serverpod/serverpod_client.dart';
import 'package:musifly/data/models/album/album.model.dart';
import 'package:musifly/data/models/track/track.model.dart';
import 'package:musifly/utils/service_locator.dart';

class PlaylistNotifier extends ChangeNotifier {
    String? playlistName;
    List<TrackModel> _tracks = []; // State to store new albums
    List<TrackModel> get tracks => _tracks;

    static final _logger = MusLogger("HomeProvider");



    Future<void> setPlaylistName(String name) async {
      final box = Hive.box('playlistName');
      await box.put('name', name);
      notifyListeners();

    }

     getPlaylistName(){
      final box = Hive.box('playlistName');
      final value = box.get('name') as String ;
        playlistName =  value;
        return playlistName;
        
     

    }

      Future<void> setPlaylistSong(TrackModel track) async{
        final box = Hive.box('playlist');
        await box.put('playlistTrack', track);
        print(track);
        notifyListeners();
      }


      getPlaylistSong(){
        final box = Hive.box('playlist');
        final value = box.get('playlistTrack') as TrackModel;

        return value;
      }




     Future<void> getNewTracks() async {
      try {
        _tracks = await getIt<ClientServerpod>().getNewTracks();

        _logger.info('notifier tracks is succeful');
      } catch (e) {
        _logger.error("Can't pull track: $e");
      }

      notifyListeners();
    }



 
}

