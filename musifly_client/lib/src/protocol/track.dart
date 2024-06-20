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

abstract class Track implements _i1.SerializableModel {
  Track._({
    this.id,
    required this.albumId,
    this.album,
    required this.artistId,
    this.artist,
    required this.title,
    required this.audioUrl,
  });

  factory Track({
    int? id,
    required int albumId,
    _i2.Album? album,
    required int artistId,
    _i2.Artist? artist,
    required String title,
    required String audioUrl,
  }) = _TrackImpl;

  factory Track.fromJson(Map<String, dynamic> jsonSerialization) {
    return Track(
      id: jsonSerialization['id'] as int?,
      albumId: jsonSerialization['albumId'] as int,
      album: jsonSerialization['album'] == null
          ? null
          : _i2.Album.fromJson(
              (jsonSerialization['album'] as Map<String, dynamic>)),
      artistId: jsonSerialization['artistId'] as int,
      artist: jsonSerialization['artist'] == null
          ? null
          : _i2.Artist.fromJson(
              (jsonSerialization['artist'] as Map<String, dynamic>)),
      title: jsonSerialization['title'] as String,
      audioUrl: jsonSerialization['audioUrl'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int albumId;

  _i2.Album? album;

  int artistId;

  _i2.Artist? artist;

  String title;

  String audioUrl;

  Track copyWith({
    int? id,
    int? albumId,
    _i2.Album? album,
    int? artistId,
    _i2.Artist? artist,
    String? title,
    String? audioUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'albumId': albumId,
      if (album != null) 'album': album?.toJson(),
      'artistId': artistId,
      if (artist != null) 'artist': artist?.toJson(),
      'title': title,
      'audioUrl': audioUrl,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TrackImpl extends Track {
  _TrackImpl({
    int? id,
    required int albumId,
    _i2.Album? album,
    required int artistId,
    _i2.Artist? artist,
    required String title,
    required String audioUrl,
  }) : super._(
          id: id,
          albumId: albumId,
          album: album,
          artistId: artistId,
          artist: artist,
          title: title,
          audioUrl: audioUrl,
        );

  @override
  Track copyWith({
    Object? id = _Undefined,
    int? albumId,
    Object? album = _Undefined,
    int? artistId,
    Object? artist = _Undefined,
    String? title,
    String? audioUrl,
  }) {
    return Track(
      id: id is int? ? id : this.id,
      albumId: albumId ?? this.albumId,
      album: album is _i2.Album? ? album : this.album?.copyWith(),
      artistId: artistId ?? this.artistId,
      artist: artist is _i2.Artist? ? artist : this.artist?.copyWith(),
      title: title ?? this.title,
      audioUrl: audioUrl ?? this.audioUrl,
    );
  }
}
