import 'package:flutter/material.dart';
import 'package:musifly/analytics/mus.logger.dart';

import '../../data/data_sources/api/rest_client/rest_client.dart';
import '../../data/models/album/album.model.dart';
import '../../data/models/song/song.model.dart';

import '../../utils/locator_service.dart';

class HomeProvider extends ChangeNotifier {
  List<AlbumModel> _newAlbums = []; // State to store new albums
  List<AlbumModel> get newAlbums => _newAlbums;

  List<SongModel> _newSongs = []; // State to store new albums
  List<SongModel> get newSongs => _newSongs;

  static final _logger = MusLogger("HomeProvider");

  Future<void> getNewAlbums() async {
    try {
      _newAlbums = await getIt<RestClient>().getNewAlbums();
    } catch (e) {
      _logger.error("Can't pull album: $e");
    }

    notifyListeners();
  }

  Future<void> getNewSongs() async {
    try {
      _newSongs = await getIt<RestClient>().getNewSongs();
    } catch (e) {
      _logger.error("Can't pull song: $e");
    }

    notifyListeners();
  }
}
