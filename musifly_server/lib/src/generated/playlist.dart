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

abstract class Playlist extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Playlist._({
    int? id,
    required this.name,
    required this.userId,
    required this.isPublic,
    required this.tracks,
    required this.createdAt,
    required this.updatedAt,
  }) : super(id);

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

  static final t = PlaylistTable();

  static const db = PlaylistRepository._();

  String name;

  String userId;

  bool isPublic;

  List<_i2.Track> tracks;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'userId': userId,
      'isPublic': isPublic,
      'tracks': tracks.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static PlaylistInclude include() {
    return PlaylistInclude._();
  }

  static PlaylistIncludeList includeList({
    _i1.WhereExpressionBuilder<PlaylistTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlaylistTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaylistTable>? orderByList,
    PlaylistInclude? include,
  }) {
    return PlaylistIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Playlist.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Playlist.t),
      include: include,
    );
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

class PlaylistTable extends _i1.Table {
  PlaylistTable({super.tableRelation}) : super(tableName: 'playlists') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    userId = _i1.ColumnString(
      'userId',
      this,
    );
    isPublic = _i1.ColumnBool(
      'isPublic',
      this,
    );
    tracks = _i1.ColumnSerializable(
      'tracks',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString userId;

  late final _i1.ColumnBool isPublic;

  late final _i1.ColumnSerializable tracks;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        userId,
        isPublic,
        tracks,
        createdAt,
        updatedAt,
      ];
}

class PlaylistInclude extends _i1.IncludeObject {
  PlaylistInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Playlist.t;
}

class PlaylistIncludeList extends _i1.IncludeList {
  PlaylistIncludeList._({
    _i1.WhereExpressionBuilder<PlaylistTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Playlist.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Playlist.t;
}

class PlaylistRepository {
  const PlaylistRepository._();

  Future<List<Playlist>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaylistTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlaylistTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaylistTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Playlist>(
      where: where?.call(Playlist.t),
      orderBy: orderBy?.call(Playlist.t),
      orderByList: orderByList?.call(Playlist.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Playlist?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaylistTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlaylistTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaylistTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Playlist>(
      where: where?.call(Playlist.t),
      orderBy: orderBy?.call(Playlist.t),
      orderByList: orderByList?.call(Playlist.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Playlist?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Playlist>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Playlist>> insert(
    _i1.Session session,
    List<Playlist> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Playlist>(
      rows,
      transaction: transaction,
    );
  }

  Future<Playlist> insertRow(
    _i1.Session session,
    Playlist row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Playlist>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Playlist>> update(
    _i1.Session session,
    List<Playlist> rows, {
    _i1.ColumnSelections<PlaylistTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Playlist>(
      rows,
      columns: columns?.call(Playlist.t),
      transaction: transaction,
    );
  }

  Future<Playlist> updateRow(
    _i1.Session session,
    Playlist row, {
    _i1.ColumnSelections<PlaylistTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Playlist>(
      row,
      columns: columns?.call(Playlist.t),
      transaction: transaction,
    );
  }

  Future<List<Playlist>> delete(
    _i1.Session session,
    List<Playlist> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Playlist>(
      rows,
      transaction: transaction,
    );
  }

  Future<Playlist> deleteRow(
    _i1.Session session,
    Playlist row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Playlist>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Playlist>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlaylistTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Playlist>(
      where: where(Playlist.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaylistTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Playlist>(
      where: where?.call(Playlist.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
