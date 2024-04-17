/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Album extends _i1.SerializableEntity {
  Album._({
    required this.cover,
    required this.artist,
    required this.title,
    required this.genre,
    required this.songs,
  });

  factory Album({
    required String cover,
    required String artist,
    required String title,
    required String genre,
    required List<_i2.Song> songs,
  }) = _AlbumImpl;

  factory Album.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Album(
      cover:
          serializationManager.deserialize<String>(jsonSerialization['cover']),
      artist:
          serializationManager.deserialize<String>(jsonSerialization['artist']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      genre:
          serializationManager.deserialize<String>(jsonSerialization['genre']),
      songs: serializationManager
          .deserialize<List<_i2.Song>>(jsonSerialization['songs']),
    );
  }

  String cover;

  String artist;

  String title;

  String genre;

  List<_i2.Song> songs;

  Album copyWith({
    String? cover,
    String? artist,
    String? title,
    String? genre,
    List<_i2.Song>? songs,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'cover': cover,
      'artist': artist,
      'title': title,
      'genre': genre,
      'songs': songs.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'cover': cover,
      'artist': artist,
      'title': title,
      'genre': genre,
      'songs': songs.toJson(valueToJson: (v) => v.allToJson()),
    };
  }
}

class _AlbumImpl extends Album {
  _AlbumImpl({
    required String cover,
    required String artist,
    required String title,
    required String genre,
    required List<_i2.Song> songs,
  }) : super._(
          cover: cover,
          artist: artist,
          title: title,
          genre: genre,
          songs: songs,
        );

  @override
  Album copyWith({
    String? cover,
    String? artist,
    String? title,
    String? genre,
    List<_i2.Song>? songs,
  }) {
    return Album(
      cover: cover ?? this.cover,
      artist: artist ?? this.artist,
      title: title ?? this.title,
      genre: genre ?? this.genre,
      songs: songs ?? this.songs.clone(),
    );
  }
}
