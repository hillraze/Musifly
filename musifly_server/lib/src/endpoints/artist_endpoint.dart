import 'package:serverpod/server.dart';

import '../generated/protocol.dart';

class ArtistEndpoint extends Endpoint {
  // Add CRUD operations for Artists
  Future<Artist> addArtist(Session session, Artist artist) async {
    var result = await Artist.db.insertRow(session, artist);
    return result;
  }

  Future<List<Artist>> getArtists(Session session) {
    return Artist.db.find(
      session,
      include: Artist.include(
        albums: Album.includeList(
          include: Album.include(
            tracks: Track.includeList(),
          ),
        ),
      ),
    );
  }

  Future<Artist> updateArtist(Session session, Artist artist) {
    return Artist.db.updateRow(session, artist);
  }

  Future<Artist> deleteArtist(Session session, Artist artist) {
    return Artist.db.deleteRow(session, artist);
  }
}
