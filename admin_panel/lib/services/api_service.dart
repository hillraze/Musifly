import 'package:musifly_client/musifly_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class ApiService {
  static final _client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  Future<List<Artist>> getArtists() async {
    final response = await _client.artist.getArtists();
    return response;
  }

  Future<Artist> addArtist(Artist artist) async {
    final response = await _client.artist.addArtist(artist);
    return response;
  }

  Future<Artist> updateArtist(Artist artist) async {
    final response = await _client.artist.updateArtist(artist);
    return response;
  }

  Future<Artist> deleteArtist(int id) async {
    final response = await _client.artist.deleteArtist(id);
    return response;
  }
}
