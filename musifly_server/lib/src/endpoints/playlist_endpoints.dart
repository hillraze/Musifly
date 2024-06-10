import 'package:musifly_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

import '../generated/playlist.dart';

class PlaylistEndpoints extends Endpoint {
  //Path: /playlist/create
  // Method: POST
  // Description: Creates a new playlist.
  Future<Playlist> PlaylistCreate(
    Session session, {
    String name = 'Untitled',
    required String userId,
    bool isPublic = false,
  }) async {
    final playlist = await session.db.insertRow<Playlist>(
      Playlist(
        name: name,
        userId: userId,
        tracks: [],
        isPublic: isPublic,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    return playlist;
  }

  /// Update Playlist with new trackIds
  Future<Playlist> addTrack(
    Session session, {
    required int playlistId,
    required int trackId,
  }) async {
    final track = await session.db.findById<Track>(trackId);

    if (track == null) {
      throw Exception('Track not found');
    }

    final playlist = await session.db.findById<Playlist>(playlistId);

    if (playlist == null) {
      throw Exception('Playlist not found');
    }

    return session.db.updateRow<Playlist>(
      playlist..tracks.add(track),
    );
  }

  Future<Playlist> getPlaylist(Session session, int id) async {
    final playlist = await session.db.findById<Playlist>(id);
    if (playlist == null) {
      throw Exception('Playlist not found');
    }

    return playlist;
  }
}
