import 'package:admin_panel/core/enums.dart';
import 'package:admin_panel/services/api_service.dart';
import 'package:flutter/material.dart';

class DashboardProvider with ChangeNotifier {
  DashboardProvider({required this.apiService});
  final ApiService apiService;

  int _albumsCount = 0;
  int _artistsCount = 0;
  int _tracksCount = 0;
  int _playlistsCount = 0;

  List<dynamic> _albums = [];
  List<dynamic> _artists = [];
  List<dynamic> _tracks = [];
  List<dynamic> _playlists = [];

  int get albumsCount => _albumsCount;
  int get artistsCount => _artistsCount;
  int get tracksCount => _tracksCount;
  int get playlistsCount => _playlistsCount;

  List<dynamic> getItemsForTable(TableEnum tableName) {
    switch (tableName) {
      case TableEnum.artist:
        return _artists;
      case TableEnum.album:
        return _albums;
      case TableEnum.track:
        return _tracks;
      case TableEnum.playlist:
        return _playlists;
      default:
        return [];
    }
  }

  Future<void> fetchOverview() async {
    _albums = await apiService.getAlbums();
    _artists = await apiService.getArtists();
    _tracks = await apiService.getTracks();
    _playlists = await apiService.getPlaylists();

    final res = await Future.wait([
      apiService.getAlbums(),
      apiService.getArtists(),
      apiService.getTracks(),
      apiService.getPlaylists(),
    ]);

    _albums = res[0];
    _artists = res[1];
    _tracks = res[2];
    _playlists = res[3];

    _albumsCount = _albums.length;
    _artistsCount = _artists.length;
    _tracksCount = _tracks.length;
    _playlistsCount = _playlists.length;

    notifyListeners();
  }

  Future<void> fetchByTable(TableEnum tableName) async {
    switch (tableName) {
      case TableEnum.artist:
        _artists = await apiService.getArtists();
        break;
      case TableEnum.album:
        _albums = await apiService.getAlbums();
        break;
      case TableEnum.track:
        _tracks = await apiService.getTracks();
        break;
      case TableEnum.playlist:
        _playlists = await apiService.getPlaylists();
        break;
    }
    notifyListeners();
  }

  Future<void> createByTable(TableEnum tableName, dynamic item) async {
    switch (tableName) {
      case TableEnum.artist:
        _artists.add(item);
        break;
      case TableEnum.album:
        _albums.add(item);
        break;
      case TableEnum.track:
        _tracks.add(item);
        break;
      case TableEnum.playlist:
        _playlists.add(item);
        break;
    }
    notifyListeners();
  }

  Future<void> deleteByTable(TableEnum tableName, dynamic item) async {
    switch (tableName) {
      case TableEnum.artist:
        _artists.remove(item);
        break;
      case TableEnum.album:
        _albums.remove(item);
        break;
      case TableEnum.track:
        _tracks.remove(item);
        break;
      case TableEnum.playlist:
        _playlists.remove(item);
        break;
    }
    notifyListeners();
  }
}
