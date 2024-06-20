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
            track: Track.include(),
          ),
        ),
      ),
    );
  }

  Future<Playlist> updatePlaylist(Session session, Playlist playlist) async {
    return Playlist.db.updateRow(session, playlist);
  }

  Future<Playlist> deletePlaylist(Session session, int id) async {
    var playlist = await Playlist.db.findById(session, id);
    if (playlist == null) {
      throw Exception('Playlist not found');
    }
    var playlistDeleted = await Playlist.db.deleteRow(session, playlist);
    return playlistDeleted;
  }
}
