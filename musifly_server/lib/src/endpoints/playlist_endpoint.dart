import 'package:musifly_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PlaylistEndpoint extends Endpoint {
  Future<Playlist> createPlaylist(Session session, Playlist playlist) async {
    return Playlist.db.insertRow(session, playlist);
  }

  Future<Playlist?> getPlaylist(Session session, int id) async {
    return await Playlist.db.findById(
      session,
      id,
      include: Playlist.include(
        playlistTracks: PlaylistTrack.includeList(
          include: PlaylistTrack.include(track: Track.include()),
        ),
      ),
    );
  }

  Future<List<Playlist>> getPlaylists(Session session) async {
    return await Playlist.db.find(
      session,
      include: Playlist.include(
        playlistTracks: PlaylistTrack.includeList(
          include: PlaylistTrack.include(
            track: Track.include(artist: Artist.include()),
          ),
        ),
      ),
    );
  }

  Future<Playlist> updatePlaylist(Session session, Playlist playlist) {
    return Playlist.db.updateRow(session, playlist);
  }

  Future<Playlist> deletePlaylist(Session session, Playlist playlist) async {
    return await session.db.transaction((transaction) async {
      try {
        // First, delete all associated playlist tracks
        await PlaylistTrack.db.deleteWhere(session,
            where: (t) => t.playlistId.equals(playlist.id));

        // Then, delete the playlist
        return await Playlist.db.deleteRow(session, playlist);
      } catch (e) {
        print('Error deleting playlist: $e');
        transaction.cancel(); // Cancel the transaction if an error occurs
        rethrow;
      }
    });
  }
}
