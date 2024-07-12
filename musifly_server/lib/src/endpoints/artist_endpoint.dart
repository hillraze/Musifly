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
    return session.db.transaction((transaction) async {
      try {
        // First, delete all associated albums
        await Album.db
            .deleteWhere(session, where: (a) => a.artistId.equals(artist.id));
        // Then, delete the artist
        await Artist.db.deleteRow(session, artist);
        return artist;
      } catch (e) {
        print('Error deleting playlist: $e');
        transaction.cancel(); // Cancel the transaction if an error occurs
        rethrow;
      }
    });
  }
}
