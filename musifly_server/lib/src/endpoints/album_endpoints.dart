import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class AlbumEndpoint extends Endpoint {
  Future<Album> createAlbum(Session session, Album album) async {
    return Album.db.insertRow(session, album);
  }

  Future<Album> updateAlbum(Session session, Album album) async {
    return Album.db.updateRow(session, album);
  }

  Future<Album> deleteAlbum(Session session, Album album) {
    return session.db.transaction((transaction) async {
      try {
        // First, delete all associated album tracks
        await Track.db
            .deleteWhere(session, where: (t) => t.albumId.equals(album.id));

        // Then, delete the album
        return await Album.db.deleteRow(session, album);
      } catch (e) {
        print('Error deleting playlist: $e');
        transaction.cancel(); // Cancel the transaction if an error occurs
        rethrow;
      }
    });
  }

  Future<List<Album>> getAlbums(Session session) async {
    return Album.db.find(
      session,
      include: Album.include(
        artist: Artist.include(),
        tracks: Track.includeList(
          include: Track.include(),
        ),
      ),
    );
  }

  Future<Album?> getAlbum(Session session, int id) async {
    return await Album.db.findById(
      session,
      id,
      include: Album.include(
        tracks: Track.includeList(
          include: Track.include(
            artist: Artist.include(),
          ),
        ),
      ),
    );
  }

  Future<List<Album>> getTopAlbums(Session session) {
    return Album.db.find(
      session,
      where: (t) => t.releasedAt.between(
        DateTime.now().subtract(Duration(days: 180)),
        DateTime.now(),
      ),
    );
  }
}
