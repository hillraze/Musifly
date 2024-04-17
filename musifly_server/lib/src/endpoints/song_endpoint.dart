import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class SongEndpoint extends Endpoint {
  // Endpoint to fetch new songs
  Future<List<Song>> getNewSongs(Session session) async {
    // Mock data for songs
    var songs = [
      Song(
        cover:
            "https://lastfm.freetls.fastly.net/i/u/770x0/1b3e92a577ea478cad88c440b26d5b39.jpg#1b3e92a577ea478cad88c440b26d5b39",
        title: "From Embrace To Embrace",
        artist: "Joy Wants Eternity",
        genre: "Rock",
        audioLink:
            "https://dl.last.fm/static/1711196557/113553508/772dadd35e1bee9c0a9eb740e89670b051c2b0f849c70865f6010dad26f1516f/Joy+Wants+Eternity+-+From+Embrace+To+Embrace.mp3",
      ),
      ...List.generate(
          5,
          (_) => Song(
                cover:
                    "https://lastfm.freetls.fastly.net/i/u/770x0/30ef0d3d35720910529fe026a2d2fe7c.jpg#30ef0d3d35720910529fe026a2d2fe7c",
                title: "Get Got",
                artist: "Death Grips",
                genre: "Pop",
                audioLink:
                    "https://dl.last.fm/static/1711196557/131211148/73edd47ee53a01958852b3d9f2938a603b603da021b2cdf1429cbb6e23370aa4/Death+Grips+-+Get+Got.mp3",
              )),
    ];

    return Future.value(songs);
  }
}
