import 'package:flutter/material.dart';
import 'package:musifly/analytics/mus.logger.dart';
import 'package:musifly/data/data_sources/api/serverpod/serverpod_client.dart';
import 'package:musifly_client/musifly_client.dart';

import '../../service_locator.dart';

class HomeProvider extends ChangeNotifier {
  List<Album> _newAlbums = []; // State to store new albums
  List<Album> get newAlbums => _newAlbums;

  List<Track> _newTracks = []; // State to store new albums
  List<Track> get newTracks => _newTracks;

  static final _logger = MusLogger("HomeProvider");

  Future<void> getNewAlbums() async {
    try {
      _newAlbums = await getIt<ServerpodApi>().getNewAlbums();
      _logger.info('notifier albums is succeful');
    } catch (e) {
      _logger.error("Can't pull album: $e");
    }

    notifyListeners();
  }

  Future<void> getNewTracks() async {
    try {
      _newTracks = await getIt<ServerpodApi>().getNewTracks();

      _logger.info('notifier tracks is succeful');
    } catch (e) {
      _logger.error("Can't pull track: $e");
    }

    notifyListeners();
  }
}
