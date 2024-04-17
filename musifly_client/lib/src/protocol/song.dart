/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Song extends _i1.SerializableEntity {
  Song._({
    required this.artist,
    required this.audioLink,
    required this.cover,
    required this.genre,
    required this.title,
  });

  factory Song({
    required String artist,
    required String audioLink,
    required String cover,
    required String genre,
    required String title,
  }) = _SongImpl;

  factory Song.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Song(
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

  String artist;

  String audioLink;

  String cover;

  String genre;

  String title;

  Song copyWith({
    String? artist,
    String? audioLink,
    String? cover,
    String? genre,
    String? title,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'artist': artist,
      'audioLink': audioLink,
      'cover': cover,
      'genre': genre,
      'title': title,
    };
  }
}

class _SongImpl extends Song {
  _SongImpl({
    required String artist,
    required String audioLink,
    required String cover,
    required String genre,
    required String title,
  }) : super._(
          artist: artist,
          audioLink: audioLink,
          cover: cover,
          genre: genre,
          title: title,
        );

  @override
  Song copyWith({
    String? artist,
    String? audioLink,
    String? cover,
    String? genre,
    String? title,
  }) {
    return Song(
      artist: artist ?? this.artist,
      audioLink: audioLink ?? this.audioLink,
      cover: cover ?? this.cover,
      genre: genre ?? this.genre,
      title: title ?? this.title,
    );
  }
}
