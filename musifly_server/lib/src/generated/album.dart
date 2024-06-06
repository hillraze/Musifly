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

abstract class Album
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
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

  factory Album.fromJson(Map<String, dynamic> jsonSerialization) {
    return Album(
      cover: jsonSerialization['cover'] as String,
      artist: jsonSerialization['artist'] as String,
      title: jsonSerialization['title'] as String,
      genre: jsonSerialization['genre'] as String,
      tracks: (jsonSerialization['tracks'] as List)
          .map((e) => _i2.Track.fromJson((e as Map<String, dynamic>)))
          .toList(),
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

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'cover': cover,
      'artist': artist,
      'title': title,
      'genre': genre,
      'tracks': tracks.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
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
