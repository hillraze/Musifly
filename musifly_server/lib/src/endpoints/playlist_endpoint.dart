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

  Future<Playlist> deletePlaylist(Session session, Playlist playlist) {
    return Playlist.db.deleteRow(session, playlist);
  }
}
