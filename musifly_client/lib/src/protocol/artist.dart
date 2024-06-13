/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Artist implements _i1.SerializableModel {
  Artist._({
    this.id,
    required this.name,
    required this.bio,
    required this.createdAt,
  });

  factory Artist({
    int? id,
    required String name,
    required String bio,
    required DateTime createdAt,
  }) = _ArtistImpl;

  factory Artist.fromJson(Map<String, dynamic> jsonSerialization) {
    return Artist(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      bio: jsonSerialization['bio'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String bio;

  DateTime createdAt;

  Artist copyWith({
    int? id,
    String? name,
    String? bio,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'bio': bio,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtistImpl extends Artist {
  _ArtistImpl({
    int? id,
    required String name,
    required String bio,
    required DateTime createdAt,
  }) : super._(
          id: id,
          name: name,
          bio: bio,
          createdAt: createdAt,
        );

  @override
  Artist copyWith({
    Object? id = _Undefined,
    String? name,
    String? bio,
    DateTime? createdAt,
  }) {
    return Artist(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
