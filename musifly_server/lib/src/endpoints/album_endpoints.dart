import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class AlbumEndpoint extends Endpoint {
  Future<Album> createAlbum(Session session, Album album) async {
    return Album.db.insertRow(session, album);
  }

  Future<Album> updateAlbum(Session session, Album album) async {
    return Album.db.updateRow(session, album);
  }

  Future<List<Album>> getAlbums(Session session) async {
    return Album.db.find(
      session,
      include: Album.include(
        artist: Artist.include(),
        tracks: Track.includeList(
          include: Track.include(
            
          ),
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

  Future<Album> deleteAlbum(Session session, int id) async {
    var album = await Album.db.findById(session, id);
    if (album == null) {
      throw Exception('Album not found');
    }
    var albumDeleted = await Album.db.deleteRow(session, album);
    return albumDeleted;
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

  Future<List<Album>> getNewAlbums(Session session) async {
    // Mock data for albums with embedded tracks
    // var albums = [
    //   ...List.generate(
    //     5,
    //     (index) => Album(
    //       coverUrl:
    //           "https://lastfm.freetls.fastly.net/i/u/770x0/30ef0d3d35720910529fe026a2d2fe7c.jpg#30ef0d3d35720910529fe026a2d2fe7c",
    //       title: "Hit of the hits",
    //       genre: "Rock",
    //       artist: "Death Grips",
    //       tracks: [
    //         Track(
    //           coverUrl:
    //               "https://lastfm.freetls.fastly.net/i/u/770x0/30ef0d3d35720910529fe026a2d2fe7c.jpg#30ef0d3d35720910529fe026a2d2fe7c",
    //           title: "Get Got",
    //           artist: "Death Grips",
    //           genre: "Pop",
    //           audioUrl:
    //               "https://dl.last.fm/static/1711196557/131211148/73edd47ee53a01958852b3d9f2938a603b603da021b2cdf1429cbb6e23370aa4/Death+Grips+-+Get+Got.mp3",
    //         ),
    //         Track(
    //           coverUrl:
    //               "https://lastfm.freetls.fastly.net/i/u/770x0/1b3e92a577ea478cad88c440b26d5b39.jpg#1b3e92a577ea478cad88c440b26d5b39",
    //           title: "From Embrace To Embrace",
    //           artist: "Joy Wants Eternity",
    //           genre: "Rock",
    //           audioUrl:
    //               "https://dl.last.fm/static/1711196557/113553508/772dadd35e1bee9c0a9eb740e89670b051c2b0f849c70865f6010dad26f1516f/Joy+Wants+Eternity+-+From+Embrace+To+Embrace.mp3",
    //         ),
    //       ],
    //     ),
    //     // Additional albums can be added here
    //   )
    // ];

    // return Future.value(albums);

    return Future.value([]);
  }
}
