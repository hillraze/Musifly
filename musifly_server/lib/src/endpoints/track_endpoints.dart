import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../generated/track.dart';

class TrackEndpoint extends Endpoint {
  Future<Track> createTrack(Session session, Track track) {
    return Track.db.insertRow(session, track);
  }

  Future<List<Track>> getTracks(Session session) {
    return Track.db.find(session);
  }

  Future<Track> updateTrack(Session session, Track track) {
    return Track.db.updateRow(session, track);
  }

  Future<Track> deleteTrack(Session session, Track track) {
    return Track.db.deleteRow(session, track);
  }
}
