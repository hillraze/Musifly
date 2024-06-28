import 'package:musifly_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PlaylistTrackEndpoint extends Endpoint {
  Future<PlaylistTrack> createPlaylistTrack(
      Session session, PlaylistTrack playlistTrack) async {
    final result = await PlaylistTrack.db.insertRow(session, playlistTrack);
    final findResult = await PlaylistTrack.db.findById(
      session,
      result.id!,
      include: PlaylistTrack.include(
        track: Track.include(
          artist: Artist.include(),
        ),
      ),
    );
    if (findResult == null) {
      return result;
    }
    return findResult;
  }

  Future<PlaylistTrack?> getPlaylistTrack(Session session, int id) async {
    return await PlaylistTrack.db.findById(
      session,
      id,
      include: PlaylistTrack.include(
        track: Track.include(
          artist: Artist.include(),
        ),
      ),
    );
  }

  Future<List<PlaylistTrack>> getPlaylistTracks(Session session) async {
    return await PlaylistTrack.db.find(
      session,
      include: PlaylistTrack.include(
        track: Track.include(
          artist: Artist.include(),
        ),
      ),
    );
  }

  Future<PlaylistTrack> updatePlaylistTrack(
      Session session, PlaylistTrack playlist) async {
    return PlaylistTrack.db.updateRow(session, playlist);
  }

  Future<PlaylistTrack> deletePlaylistTrack(Session session, int id) async {
    var playlist = await PlaylistTrack.db.findById(session, id);
    if (playlist == null) {
      throw Exception('PlaylistTrack not found');
    }
    var playlistDeleted = await PlaylistTrack.db.deleteRow(session, playlist);
    return playlistDeleted;
  }
}
