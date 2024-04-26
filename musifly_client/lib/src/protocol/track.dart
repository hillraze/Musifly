/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Track extends _i1.SerializableEntity {
  Track._({
    this.id,
    required this.artist,
    required this.audioLink,
    required this.cover,
    required this.genre,
    required this.title,
  });

  factory Track({
    int? id,
    required String artist,
    required String audioLink,
    required String cover,
    required String genre,
    required String title,
  }) = _TrackImpl;

  factory Track.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Track(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      artist:
          serializationManager.deserialize<String>(jsonSerialization['artist']),
      audioLink: serializationManager
          .deserialize<String>(jsonSerialization['audioLink']),
      cover:
          serializationManager.deserialize<String>(jsonSerialization['cover']),
      genre:
          serializationManager.deserialize<String>(jsonSerialization['genre']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String artist;

  String audioLink;

  String cover;

  String genre;

  String title;

  Track copyWith({
    int? id,
    String? artist,
    String? audioLink,
    String? cover,
    String? genre,
    String? title,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'artist': artist,
      'audioLink': audioLink,
      'cover': cover,
      'genre': genre,
      'title': title,
    };
  }
}

class _Undefined {}

class _TrackImpl extends Track {
  _TrackImpl({
    int? id,
    required String artist,
    required String audioLink,
    required String cover,
    required String genre,
    required String title,
  }) : super._(
          id: id,
          artist: artist,
          audioLink: audioLink,
          cover: cover,
          genre: genre,
          title: title,
        );

  @override
  Track copyWith({
    Object? id = _Undefined,
    String? artist,
    String? audioLink,
    String? cover,
    String? genre,
    String? title,
  }) {
    return Track(
      id: id is int? ? id : this.id,
      artist: artist ?? this.artist,
      audioLink: audioLink ?? this.audioLink,
      cover: cover ?? this.cover,
      genre: genre ?? this.genre,
      title: title ?? this.title,
    );
  }
}
