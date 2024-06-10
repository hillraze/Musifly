import 'package:flutter/material.dart';
import 'package:musifly/analytics/mus.logger.dart';
import 'package:musifly/data/data_sources/api/serverpod/serverpod_client.dart';
import '../../data/models/album/album.model.dart';
import '../../data/models/track/track.model.dart';

import '../../utils/service_locator.dart';

class HomeProvider extends ChangeNotifier {
  List<AlbumModel> _newAlbums = []; // State to store new albums
  List<AlbumModel> get newAlbums => _newAlbums;

  List<TrackModel> _newTracks = []; // State to store new albums
  List<TrackModel> get newTracks => _newTracks;

  static final _logger = MusLogger("HomeProvider");

  Future<void> getNewAlbums() async {
    try {
      _newAlbums = await getIt<ClientServerpod>().getNewAlbums();
      _logger.info('notifier albums is succeful');
    } catch (e) {
      _logger.error("Can't pull album: $e");
    }

    notifyListeners();
  }

  Future<void> getNewTracks() async {
    try {
      _newTracks = await getIt<ClientServerpod>().getNewTracks();

      _logger.info('notifier tracks is succeful');
    } catch (e) {
      _logger.error("Can't pull track: $e");
    }

    notifyListeners();
  }
}
