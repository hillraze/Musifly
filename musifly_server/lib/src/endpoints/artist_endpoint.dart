import 'package:serverpod/server.dart';

import '../generated/protocol.dart';

class ArtistEndpoint extends Endpoint {
  // Add CRUD operations for Artists
  Future<Artist> addArtist(Session session, Artist artist) async {
    var result = await Artist.db.insertRow(session, artist);
    return result;
  }

  Future<List<Artist>> getArtists(Session session) async {
    return await Artist.db.find(session);
  }

  Future<Artist> updateArtist(Session session, Artist artist) async {
    return await Artist.db.updateRow(session, artist);
  }

  Future<Artist> deleteArtist(Session session, int id) async {
    var artist = await Artist.db.findById(session, id);
    if (artist == null) {
      throw Exception('Artist not found');
    }
    var artistDeleted = await Artist.db.deleteRow(session, artist);
    return artistDeleted;
  }
}
