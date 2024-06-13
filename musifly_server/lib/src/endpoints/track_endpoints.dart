import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../generated/track.dart';

class TrackEndpoint extends Endpoint {
  Future<Track> createTrack(Session session, Track track) async {
    final newTrack = await Track.db.insertRow(session, track);
    return newTrack;
  }

  Future<Track> updateTrack(Session session, Track track) async {
    final updatedTrack = await Track.db.updateRow(session, track);
    return updatedTrack;
  }

  Future<Track> deleteTrack(Session session, int id) async {
    final track = await Track.db.findById(session, id);
    if (track == null) {
      throw Exception('Track not found');
    }
    final deletedTrack = await Track.db.deleteRow(session, track);
    return deletedTrack;
  }

  Future<List<Track>> getTracks(Session session) async {
    return await Track.db.find(session);
  }
}
