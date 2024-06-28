import 'package:flutter/material.dart';
import 'package:musifly/analytics/mus.logger.dart';
import 'package:musifly/data/data_sources/api/serverpod/serverpod_client.dart';
import 'package:musifly/service_locator.dart';
import 'package:musifly_client/musifly_client.dart';

class PlaylistNotifier extends ChangeNotifier {
  // String? playlistName;
  List<Track> _tracks = []; // State to store new albums
  List<Track> get tracks => _tracks;

  List<Playlist> _playlists = [];
  List<Playlist> get playlists => _playlists;

  Playlist? _currentPlaylist;
  Playlist? get currentPlaylist => _currentPlaylist;

  void setPlaylist(Playlist playlist) {
    _currentPlaylist = playlist;
    notifyListeners();
  }

  Playlist? _createdPlaylist;
  Playlist? get createdPlaylist => _createdPlaylist;

  PlaylistTrack? _addedTrack;
  PlaylistTrack? get addedTrack => _addedTrack;

  static final _logger = MusLogger("HomeProvider");

  Future<void> getNewTracks() async {
    try {
      _tracks = await getIt<ServerpodApi>().getNewTracks();

      _logger.info('notifier tracks is succeful');
    } catch (e) {
      _logger.error("Can't pull track: $e");
    }

    notifyListeners();
  }

  Future<void> getMyPlaylists() async {
    try {
      _playlists = await getIt<ServerpodApi>().getNewPlaylists();
      notifyListeners();
      _logger.info('notifier playlists is succeful');
    } catch (e) {
      _logger.error("Can't pull playlists");
    }
  }

  // Future<void> getMyPlaylistTracks() async {
  //   try {
  //     _playlist?.playlistTracks =
  //         await getIt<ServerpodApi>().getPlaylistTracks();
  //     _logger.info('notifier playlistsTracks is succeful');
  //   } catch (e) {
  //     _logger.error("Can't pull playlistTracks");
  //   }
  // }

  Future<void> addTracks(
    int trackId,
    int playlistId,
  ) async {
    try {
      final added = PlaylistTrack(trackId: trackId, playlistId: playlistId);
      // Assuming createPlaylistTrack returns a PlaylistTrack
      final createdTrack =
          await getIt<ServerpodApi>().createPlaylistTrack(added);

      // Adding the created track to the list

      _currentPlaylist!.playlistTracks!.add(createdTrack);

      notifyListeners();
      _logger.info('add song is successful');
    } catch (e) {
      _logger.error("Can't add song");
    }
  }

  Future<void> deleteTracks(PlaylistTrack playlistTrack) async {
    try {
      PlaylistTrack deletedTrack =
          await getIt<ServerpodApi>().deletePlaylistTrack(playlistTrack);
      _currentPlaylist!.playlistTracks
          ?.removeWhere((track) => track.id == deletedTrack.id);
      notifyListeners();
      _logger.info('Delete playlistTrack is successful');
      print('notifier delete');
    } catch (e) {
      _logger.error("Can't delete playlistTrack: $e");
    }
  }

  Future<void> createPlaylist(String name, DateTime createdAt) async {
    try {
      final playlist = Playlist(name: name, createdAt: createdAt);

      _createdPlaylist =
          await getIt<ServerpodApi>().createNewPlaylist(playlist);
      await getMyPlaylists();
      _logger.info('create playlist is succeful');
    } catch (e) {
      _logger.error("Can't create playlist");
    }
  }
}
