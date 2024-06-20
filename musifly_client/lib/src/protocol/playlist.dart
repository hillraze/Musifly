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

abstract class Playlist implements _i1.SerializableModel {
  Playlist._({
    this.id,
    required this.name,
    this.description,
    this.playlistTracks,
    required this.createdAt,
  });

  factory Playlist({
    int? id,
    required String name,
    String? description,
    List<_i2.PlaylistTrack>? playlistTracks,
    required DateTime createdAt,
  }) = _PlaylistImpl;

  factory Playlist.fromJson(Map<String, dynamic> jsonSerialization) {
    return Playlist(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      playlistTracks: (jsonSerialization['playlistTracks'] as List?)
          ?.map((e) => _i2.PlaylistTrack.fromJson((e as Map<String, dynamic>)))
          .toList(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? description;

  List<_i2.PlaylistTrack>? playlistTracks;

  DateTime createdAt;

  Playlist copyWith({
    int? id,
    String? name,
    String? description,
    List<_i2.PlaylistTrack>? playlistTracks,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      if (playlistTracks != null)
        'playlistTracks':
            playlistTracks?.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlaylistImpl extends Playlist {
  _PlaylistImpl({
    int? id,
    required String name,
    String? description,
    List<_i2.PlaylistTrack>? playlistTracks,
    required DateTime createdAt,
  }) : super._(
          id: id,
          name: name,
          description: description,
          playlistTracks: playlistTracks,
          createdAt: createdAt,
        );

  @override
  Playlist copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    Object? playlistTracks = _Undefined,
    DateTime? createdAt,
  }) {
    return Playlist(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      playlistTracks: playlistTracks is List<_i2.PlaylistTrack>?
          ? playlistTracks
          : this.playlistTracks?.clone(),
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
