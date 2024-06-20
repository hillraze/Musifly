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

abstract class Album implements _i1.SerializableModel {
  Album._({
    this.id,
    required this.title,
    this.genre,
    this.coverUrl,
    required this.artistId,
    this.artist,
    this.tracks,
    this.releasedAt,
  });

  factory Album({
    int? id,
    required String title,
    String? genre,
    String? coverUrl,
    required int artistId,
    _i2.Artist? artist,
    List<_i2.Track>? tracks,
    DateTime? releasedAt,
  }) = _AlbumImpl;

  factory Album.fromJson(Map<String, dynamic> jsonSerialization) {
    return Album(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      genre: jsonSerialization['genre'] as String?,
      coverUrl: jsonSerialization['coverUrl'] as String?,
      artistId: jsonSerialization['artistId'] as int,
      artist: jsonSerialization['artist'] == null
          ? null
          : _i2.Artist.fromJson(
              (jsonSerialization['artist'] as Map<String, dynamic>)),
      tracks: (jsonSerialization['tracks'] as List?)
          ?.map((e) => _i2.Track.fromJson((e as Map<String, dynamic>)))
          .toList(),
      releasedAt: jsonSerialization['releasedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['releasedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String? genre;

  String? coverUrl;

  int artistId;

  _i2.Artist? artist;

  List<_i2.Track>? tracks;

  DateTime? releasedAt;

  Album copyWith({
    int? id,
    String? title,
    String? genre,
    String? coverUrl,
    int? artistId,
    _i2.Artist? artist,
    List<_i2.Track>? tracks,
    DateTime? releasedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      if (genre != null) 'genre': genre,
      if (coverUrl != null) 'coverUrl': coverUrl,
      'artistId': artistId,
      if (artist != null) 'artist': artist?.toJson(),
      if (tracks != null)
        'tracks': tracks?.toJson(valueToJson: (v) => v.toJson()),
      if (releasedAt != null) 'releasedAt': releasedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AlbumImpl extends Album {
  _AlbumImpl({
    int? id,
    required String title,
    String? genre,
    String? coverUrl,
    required int artistId,
    _i2.Artist? artist,
    List<_i2.Track>? tracks,
    DateTime? releasedAt,
  }) : super._(
          id: id,
          title: title,
          genre: genre,
          coverUrl: coverUrl,
          artistId: artistId,
          artist: artist,
          tracks: tracks,
          releasedAt: releasedAt,
        );

  @override
  Album copyWith({
    Object? id = _Undefined,
    String? title,
    Object? genre = _Undefined,
    Object? coverUrl = _Undefined,
    int? artistId,
    Object? artist = _Undefined,
    Object? tracks = _Undefined,
    Object? releasedAt = _Undefined,
  }) {
    return Album(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      genre: genre is String? ? genre : this.genre,
      coverUrl: coverUrl is String? ? coverUrl : this.coverUrl,
      artistId: artistId ?? this.artistId,
      artist: artist is _i2.Artist? ? artist : this.artist?.copyWith(),
      tracks: tracks is List<_i2.Track>? ? tracks : this.tracks?.clone(),
      releasedAt: releasedAt is DateTime? ? releasedAt : this.releasedAt,
    );
  }
}
