import 'package:admin_panel/core/enums.dart';
import 'package:admin_panel/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:musifly_client/musifly_client.dart';

class DashboardProvider with ChangeNotifier {
  DashboardProvider({required this.apiService});
  final ApiService apiService;

  List<Album> _albums = [];
  List<Artist> _artists = [];
  List<Track> _tracks = [];
  List<Playlist> _playlists = [];
  List<PlaylistTrack> _playlistTracks = [];

  int get albumsCount => _albums.length;
  int get artistsCount => _artists.length;
  int get tracksCount => _tracks.length;
  int get playlistsCount => _playlists.length;
  int get playlistTracksCount => _playlistTracks.length;

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
      case TableEnum.playlistTrack:
        return _playlistTracks;
      default:
        return [];
    }
  }

  Future<void> fetchOverview() async {
    _albums = await apiService.getAlbums();
    _artists = await apiService.getArtists();
    _tracks = await apiService.getTracks();
    _playlists = await apiService.getPlaylists();
    _playlistTracks = await apiService.getPlaylistTracks();

    final res = await Future.wait([
      apiService.getAlbums(),
      apiService.getArtists(),
      apiService.getTracks(),
      apiService.getPlaylists(),
      apiService.getPlaylistTracks(),
    ]);

    _albums = res[0] as List<Album>;
    _artists = res[1] as List<Artist>;
    _tracks = res[2] as List<Track>;
    _playlists = res[3] as List<Playlist>;
    _playlistTracks = res[4] as List<PlaylistTrack>;

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
      case TableEnum.playlistTrack:
        _playlistTracks = await apiService.getPlaylistTracks();
        break;
      default:
        throw Exception('Table $tableName not found');
    }
    notifyListeners();
  }

  Future<void> createByTable(
    TableEnum tableName,
    Map<String, dynamic> model,
  ) async {
    switch (tableName) {
      case TableEnum.artist:
        final res = await apiService.createArtist(Artist.fromJson(model));
        _artists.add(res);
        break;

      case TableEnum.album:
        final res = await apiService.createAlbum(Album.fromJson(model));
        _albums.add(res);
        break;

      case TableEnum.track:
        final res = await apiService.createTrack(Track.fromJson(model));
        _tracks.add(res);
        break;

      case TableEnum.playlist:
        final res = await apiService.createPlaylist(Playlist.fromJson(model));
        _playlists.add(res);
        break;
      case TableEnum.playlistTrack:
        final res =
            await apiService.createPlaylistTrack(PlaylistTrack.fromJson(model));
        _playlistTracks.add(res);
        break;
      default:
        throw Exception('Table $tableName not found');
    }
    notifyListeners();
  }

  Future<void> deleteByTable(
      TableEnum tableName, Map<String, dynamic> item) async {
    switch (tableName) {
      case TableEnum.artist:
        final res = await apiService.deleteArtist(Artist.fromJson(item).id!);
        _artists.remove(res);
        break;
      case TableEnum.album:
        final res = await apiService.deleteAlbum(Album.fromJson(item).id!);
        _albums.remove(res);
        break;
      case TableEnum.track:
        final res = await apiService.deleteTrack(Track.fromJson(item).id!);
        _tracks.remove(res);
        break;
      case TableEnum.playlist:
        final res =
            await apiService.deletePlaylist(Playlist.fromJson(item).id!);
        _playlists.remove(res);
        break;
      case TableEnum.playlistTrack:
        final res =
            await apiService.deletePlaylistTrack(PlaylistTrack.fromJson(item));
        _playlistTracks.remove(res);
        break;
      default:
        throw Exception('Table $tableName not found');
    }
    notifyListeners();
  }
}
