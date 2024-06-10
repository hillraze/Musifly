import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class PlaylistNotifier extends ChangeNotifier {
    String? playlistName;



    Future<void> setPlaylistName(String name) async {
      playlistName = name;
      final box = Hive.box('storage');
      await box.put('playlistName', name);
      notifyListeners();

    }

     getPlaylistName(){
      final box = Hive.box('storage');
      final value = box.get('playlistName') as String ;

      //case : if playlist name is correctly typed.
      if(playlistName != null){
        playlistName =  value;
        // print(playlistName);
        return playlistName;
        
      }else return print('ERROR IN GETPLAYLISTNAME');

    }



  // bool isFirstVisit;

  // PlaylistNotifier({this.isFirstVisit = true});

  // Future<void> setFirstVisit() async {
  //   isFirstVisit = false;

  //   final box = Hive.box('storage');
  //   await box.put('isFirstVisit', false);

  //   notifyListeners();
  // }

  // bool getFirstVisit() {
  //   //specific case: isFirstVisit is already false
  //   if (!isFirstVisit) return false;

  //   final box = Hive.box('storage');
  //   final value = box.get('isFirstVisit') as bool?;

  //   // case 1: storage has value
  //   if (value != null) {
  //     isFirstVisit = value;

  //     return isFirstVisit;
  //   }

  //   // case 2: storage is empty
  //   return isFirstVisit;
  // }
}


// Hive


// Provider


// UI