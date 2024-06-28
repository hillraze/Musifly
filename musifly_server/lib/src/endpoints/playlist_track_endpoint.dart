import 'package:musifly_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PlaylistTrackEndpoint extends Endpoint {
  Future<PlaylistTrack> createPlaylistTrack(
    Session session,
    PlaylistTrack playlistTrack,
  ) async {
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

    return findResult ?? result;
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
    Session session,
    PlaylistTrack playlistTrack,
  ) async {
    return PlaylistTrack.db.updateRow(session, playlistTrack);
  }

  Future<PlaylistTrack> deletePlaylistTrack(
    Session session,
    PlaylistTrack playlistTrack,
  ) {
    return PlaylistTrack.db.deleteRow(session, playlistTrack);
  }
}
