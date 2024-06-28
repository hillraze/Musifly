import 'package:musifly/analytics/mus.logger.dart';
import 'package:musifly_client/musifly_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// We will use this client as singleton in GetIt Service Locator
// It's enough to create Client Object from serverpod_flutter here
class ServerpodApi {
  ServerpodApi(String baseUrl) {
    _client = Client(baseUrl)
      ..connectivityMonitor = FlutterConnectivityMonitor();
  }
  late final Client _client;

  static final MusLogger _logger = MusLogger("ServerpodApi");

  Future<List<Album>> getNewAlbums() async {
    try {
      final res = await _client.album.getAlbums();

      // There we should convert Server Model to our Frontend Model
      // To make it more clear and robust to use

      _logger.info('client getNewAlbums is succeful');
      return res;
    } catch (e) {
      _logger.error(e);
      rethrow;
    }
  }

  Future<List<PlaylistTrack>> getPlaylistTracks() async {
    try {
      final res = await _client.playlistTrack.getPlaylistTracks();
      _logger.info('client getPlaylistTracks is succeful');
      return res;
    } catch (e) {
      _logger.error(e);
      rethrow;
    }
  }

  Future<List<Playlist>> getNewPlaylists() async {
    try {
      final res = await _client.playlist.getPlaylists();

      _logger.info('client getNewAlbums is succeful');
      return res;
    } catch (e) {
      _logger.error(e);
      rethrow;
    }
  }

  Future<Playlist> createNewPlaylist(Playlist playlist) async {
    try {
      final res = await _client.playlist.createPlaylist(playlist);
      _logger.info('client createNewPlaylist is succeful');
      return res;
    } catch (e) {
      _logger.error(e);
      rethrow;
    }
  }

  Future<PlaylistTrack> createPlaylistTrack(PlaylistTrack playlistTrack) async {
    try {
      final res =
          await _client.playlistTrack.createPlaylistTrack(playlistTrack);
      _logger.info('client createPlaylistTrack is succeful');
      print('GOOD');
      return res;
    } catch (e) {
      _logger.error(e);
      print('BAD');
      rethrow;
    }
  }

  Future<PlaylistTrack> deletePlaylistTrack(int id) async {
    try {
      final res = await _client.playlistTrack.deletePlaylistTrack(id);
      _logger.info('client deletePlaylistTrack is succeful');
      print('playlistTrack deleted');
      return res;
    } catch (e) {
      _logger.error(e);
      print('ERROR DELETE');
      rethrow;
    }
  }

  Future<List<Track>> getNewTracks() async {
    try {
      final res = await _client.track.getTracks();

      // There we should convert Server Model to our Frontend Model
      // To make it more clear and robust to use

      _logger.info('client getNewTracks is succeful');

      return res;
    } catch (e) {
      _logger.error(e);
      rethrow;
    }
  }
}
