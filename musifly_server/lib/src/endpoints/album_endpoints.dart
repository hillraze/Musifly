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
    return Album.db.deleteRow(session, album);
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
