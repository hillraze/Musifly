/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class PlaylistTrack implements _i1.SerializableModel {
  PlaylistTrack._({
    this.id,
    required this.playlistId,
    this.playlist,
    required this.trackId,
    this.track,
    required this.addedAt,
  });

  factory PlaylistTrack({
    int? id,
    required int playlistId,
    _i2.Playlist? playlist,
    required int trackId,
    _i2.Track? track,
    required DateTime addedAt,
  }) = _PlaylistTrackImpl;

  factory PlaylistTrack.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlaylistTrack(
      id: jsonSerialization['id'] as int?,
      playlistId: jsonSerialization['playlistId'] as int,
      playlist: jsonSerialization['playlist'] == null
          ? null
          : _i2.Playlist.fromJson(
              (jsonSerialization['playlist'] as Map<String, dynamic>)),
      trackId: jsonSerialization['trackId'] as int,
      track: jsonSerialization['track'] == null
          ? null
          : _i2.Track.fromJson(
              (jsonSerialization['track'] as Map<String, dynamic>)),
      addedAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['addedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int playlistId;

  _i2.Playlist? playlist;

  int trackId;

  _i2.Track? track;

  DateTime addedAt;

  PlaylistTrack copyWith({
    int? id,
    int? playlistId,
    _i2.Playlist? playlist,
    int? trackId,
    _i2.Track? track,
    DateTime? addedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'playlistId': playlistId,
      if (playlist != null) 'playlist': playlist?.toJson(),
      'trackId': trackId,
      if (track != null) 'track': track?.toJson(),
      'addedAt': addedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlaylistTrackImpl extends PlaylistTrack {
  _PlaylistTrackImpl({
    int? id,
    required int playlistId,
    _i2.Playlist? playlist,
    required int trackId,
    _i2.Track? track,
    required DateTime addedAt,
  }) : super._(
          id: id,
          playlistId: playlistId,
          playlist: playlist,
          trackId: trackId,
          track: track,
          addedAt: addedAt,
        );

  @override
  PlaylistTrack copyWith({
    Object? id = _Undefined,
    int? playlistId,
    Object? playlist = _Undefined,
    int? trackId,
    Object? track = _Undefined,
    DateTime? addedAt,
  }) {
    return PlaylistTrack(
      id: id is int? ? id : this.id,
      playlistId: playlistId ?? this.playlistId,
      playlist:
          playlist is _i2.Playlist? ? playlist : this.playlist?.copyWith(),
      trackId: trackId ?? this.trackId,
      track: track is _i2.Track? ? track : this.track?.copyWith(),
      addedAt: addedAt ?? this.addedAt,
    );
  }
}
