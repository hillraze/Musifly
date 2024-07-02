import 'package:flutter/material.dart';
import 'package:musifly/analytics/mus.logger.dart';
import 'package:musifly/data/data_sources/api/serverpod/serverpod_client.dart';
import 'package:musifly/service_locator.dart';
import 'package:musifly_client/musifly_client.dart';

class SearchNotifier extends ChangeNotifier {
  List<Track> _allTracks = []; // State to store all tracks
  List<Track> _tracks = []; // State to store filtered tracks
  List<Track> get tracks => _tracks;

  List<Album> _allAlbums = []; // State to store all albums
  List<Album> _albums = []; // State to store filtered albums
  List<Album> get albums => _albums;

  List<Artist> _allArtists = []; // State to store all artists
  List<Artist> _artists = []; // State to store filtered artists
  List<Artist> get artists => _artists;

  static final _logger = MusLogger("HomeProvider");

  Future<void> getNewTracks() async {
    try {
      _allTracks = await getIt<ServerpodApi>().getNewTracks();
      _tracks = _allTracks;
      _logger.info('notifier tracks is successful');
    } catch (e) {
      _logger.error("Can't pull track: $e");
    }

    notifyListeners();
  }

  Future<void> getNewAlbums() async {
    try {
      _allAlbums = await getIt<ServerpodApi>().getNewAlbums();
      _albums = _allAlbums;
      _logger.info('notifier albums is successful');
    } catch (e) {
      _logger.error("Can't pull album: $e");
    }

    notifyListeners();
  }

  Future<void> getNewArtists() async {
    try {
      _allArtists = await getIt<ServerpodApi>().getNewArtists();
      _artists = _allArtists;
      _logger.info('notifier artists is successful');
    } catch (e) {
      _logger.error("Can't pull artist: $e");
    }

    notifyListeners();
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      _tracks = _allTracks;
      _albums = _allAlbums;
      _artists = _allArtists;
    } else {
      _tracks = _allTracks
          .where((track) =>
              track.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _albums = _allAlbums
          .where((album) =>
              album.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _artists = _allArtists
          .where((artist) =>
              artist.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
