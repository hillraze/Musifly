import 'package:musifly/analytics/mus.logger.dart';
import 'package:musifly/data/models/album/album.model.dart';
import 'package:musifly_client/musifly_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import '../../../models/song/song.model.dart';

// We will use this client as singleton in GetIt Service Locator
// It's enough to create Client Object from serverpod_flutter here
class ClientServerpod {
  ClientServerpod(String baseUrl) {
    _client = Client(baseUrl)
      ..connectivityMonitor = FlutterConnectivityMonitor();
  }
  late final Client _client;

  static final MusLogger _logger = MusLogger("ClientServerpod");

  Future<List<AlbumModel>> getNewAlbums() async {
    try {
      final res = await _client.album.getNewAlbums();

      // There we should convert Server Model to our Frontend Model
      // To make it more clear and robust to use

      final model = res.map(AlbumModel.fromResponse).toList();
      _logger.info('client getNewAlbums is succeful');
      return model;
    } catch (e) {
      _logger.error(e);
      rethrow;
    }
  }

  Future<List<SongModel>> getNewSongs() async {
    try {
      final res = await _client.song.getNewSongs();

      // There we should convert Server Model to our Frontend Model
      // To make it more clear and robust to use

      final model = res.map(SongModel.fromResponse).toList();
      return model;
    } catch (e) {
      _logger.error(e);
      rethrow;
    }
  }
}