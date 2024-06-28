import 'package:musifly_client/musifly_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class ApiService {
  static final _client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  Future<Artist> createArtist(Artist artist) async {
    final response = await _client.artist.addArtist(artist);
    return response;
  }

  Future<Artist> updateArtist(Artist artist) async {
    final response = await _client.artist.updateArtist(artist);
    return response;
  }

  Future<List<Artist>> getArtists() async {
    final response = await _client.artist.getArtists();
    return response;
  }

  Future<Artist> deleteArtist(int id) async {
    final response = await _client.artist.deleteArtist(id);
    return response;
  }

  /// Albums
  Future<Album> createAlbum(Album album) async {
    final response = await _client.album.createAlbum(album);
    return response;
  }

  Future<Album> updateAlbum(Album album) async {
    final response = await _client.album.updateAlbum(album);
    return response;
  }

  Future<List<Album>> getAlbums() async {
    final response = await _client.album.getAlbums();
    return response;
  }

  Future<Album> deleteAlbum(int id) async {
    final response = await _client.album.deleteAlbum(id);
    return response;
  }

  /// Tracks
  Future<Track> createTrack(Track track) async {
    final response = await _client.track.createTrack(track);
    return response;
  }

  Future<Track> updateTrack(Track track) async {
    final response = await _client.track.updateTrack(track);
    return response;
  }

  Future<List<Track>> getTracks() async {
    final response = await _client.track.getTracks();
    return response;
  }

  Future<Track> deleteTrack(int id) async {
    final response = await _client.track.deleteTrack(id);
    return response;
  }

  /// Playlists
  Future<Playlist> createPlaylist(Playlist playlist) async {
    final response = await _client.playlist.createPlaylist(playlist);
    return response;
  }

  Future<Playlist> updatePlaylist(Playlist playlist) async {
    final response = await _client.playlist.updatePlaylist(playlist);
    return response;
  }

  Future<List<Playlist>> getPlaylists() async {
    final response = await _client.playlist.getPlaylists();
    return response;
  }

  Future<Playlist> deletePlaylist(int id) async {
    final response = await _client.playlist.deletePlaylist(id);
    return response;
  }

  // PlaylistTracks
  Future<PlaylistTrack> createPlaylistTrack(PlaylistTrack playlistTrack) async {
    final response =
        await _client.playlistTrack.createPlaylistTrack(playlistTrack);
    return response;
  }

  Future<PlaylistTrack> updatePlaylistTrack(PlaylistTrack playlistTrack) async {
    final response =
        await _client.playlistTrack.updatePlaylistTrack(playlistTrack);
    return response;
  }

  Future<List<PlaylistTrack>> getPlaylistTracks() async {
    final response = await _client.playlistTrack.getPlaylistTracks();
    return response;
  }

  Future<PlaylistTrack> deletePlaylistTrack(PlaylistTrack playlistTrack) async {
    final response =
        await _client.playlistTrack.deletePlaylistTrack(playlistTrack);
    return response;
  }
}
