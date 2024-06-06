import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../generated/track.dart';

class TrackEndpoint extends Endpoint {
  /// Get a Track by ID
  /// @param id The ID of the Track
  Future<Track> getTrack(Session session, int id) async {
    final track = await session.db.findById<Track>(id);
    if (track == null) {
      throw Exception('Track not found');
    }
    return track;
  }

  // Endpoint to fetch new Tracks
  Future<List<Track>> getNewTracks(Session session) async {
    // Mock data for Tracks
    final tracks = [
      Track(
        cover:
            "https://lastfm.freetls.fastly.net/i/u/770x0/1b3e92a577ea478cad88c440b26d5b39.jpg#1b3e92a577ea478cad88c440b26d5b39",
        title: "From Embrace To Embrace",
        artist: "Joy Wants Eternity",
        genre: "Rock",
        audioLink: "https://playi.net/music/0-0-1-26083-20",
      ),
      ...List.generate(
          5,
          (_) => Track(
                cover:
                    "https://lastfm.freetls.fastly.net/i/u/770x0/30ef0d3d35720910529fe026a2d2fe7c.jpg#30ef0d3d35720910529fe026a2d2fe7c",
                title: "Get Got",
                artist: "Death Grips",
                genre: "Pop",
                audioLink: "https://playi.net/music/0-0-1-26083-20",
              )),
    ];

    return Future.value(tracks);
  }
}
