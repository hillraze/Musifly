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
    required this.userId,
    required this.isPublic,
    required this.tracks,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Playlist({
    int? id,
    required String name,
    required String userId,
    required bool isPublic,
    required List<_i2.Track> tracks,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PlaylistImpl;

  factory Playlist.fromJson(Map<String, dynamic> jsonSerialization) {
    return Playlist(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      userId: jsonSerialization['userId'] as String,
      isPublic: jsonSerialization['isPublic'] as bool,
      tracks: (jsonSerialization['tracks'] as List)
          .map((e) => _i2.Track.fromJson((e as Map<String, dynamic>)))
          .toList(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String userId;

  bool isPublic;

  List<_i2.Track> tracks;

  DateTime createdAt;

  DateTime updatedAt;

  Playlist copyWith({
    int? id,
    String? name,
    String? userId,
    bool? isPublic,
    List<_i2.Track>? tracks,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'userId': userId,
      'isPublic': isPublic,
      'tracks': tracks.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
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
    required String userId,
    required bool isPublic,
    required List<_i2.Track> tracks,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          name: name,
          userId: userId,
          isPublic: isPublic,
          tracks: tracks,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Playlist copyWith({
    Object? id = _Undefined,
    String? name,
    String? userId,
    bool? isPublic,
    List<_i2.Track>? tracks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Playlist(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      isPublic: isPublic ?? this.isPublic,
      tracks: tracks ?? this.tracks.clone(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
