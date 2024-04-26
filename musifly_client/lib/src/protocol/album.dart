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

abstract class Album extends _i1.SerializableEntity {
  Album._({
    required this.cover,
    required this.artist,
    required this.title,
    required this.genre,
    required this.tracks,
  });

  factory Album({
    required String cover,
    required String artist,
    required String title,
    required String genre,
    required List<_i2.Track> tracks,
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
      tracks: serializationManager
          .deserialize<List<_i2.Track>>(jsonSerialization['tracks']),
    );
  }

  String cover;

  String artist;

  String title;

  String genre;

  List<_i2.Track> tracks;

  Album copyWith({
    String? cover,
    String? artist,
    String? title,
    String? genre,
    List<_i2.Track>? tracks,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'cover': cover,
      'artist': artist,
      'title': title,
      'genre': genre,
      'tracks': tracks.toJson(valueToJson: (v) => v.toJson()),
    };
  }
}

class _AlbumImpl extends Album {
  _AlbumImpl({
    required String cover,
    required String artist,
    required String title,
    required String genre,
    required List<_i2.Track> tracks,
  }) : super._(
          cover: cover,
          artist: artist,
          title: title,
          genre: genre,
          tracks: tracks,
        );

  @override
  Album copyWith({
    String? cover,
    String? artist,
    String? title,
    String? genre,
    List<_i2.Track>? tracks,
  }) {
    return Album(
      cover: cover ?? this.cover,
      artist: artist ?? this.artist,
      title: title ?? this.title,
      genre: genre ?? this.genre,
      tracks: tracks ?? this.tracks.clone(),
    );
  }
}
