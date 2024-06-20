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
    this.description,
    this.playlistTracks,
    required this.createdAt,
  }) : super(id);

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

  static final t = PlaylistTable();

  static const db = PlaylistRepository._();

  String name;

  String? description;

  List<_i2.PlaylistTrack>? playlistTracks;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      if (playlistTracks != null)
        'playlistTracks':
            playlistTracks?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'createdAt': createdAt.toJson(),
    };
  }

  static PlaylistInclude include(
      {_i2.PlaylistTrackIncludeList? playlistTracks}) {
    return PlaylistInclude._(playlistTracks: playlistTracks);
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

class PlaylistTable extends _i1.Table {
  PlaylistTable({super.tableRelation}) : super(tableName: 'playlist') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  _i2.PlaylistTrackTable? ___playlistTracks;

  _i1.ManyRelation<_i2.PlaylistTrackTable>? _playlistTracks;

  late final _i1.ColumnDateTime createdAt;

  _i2.PlaylistTrackTable get __playlistTracks {
    if (___playlistTracks != null) return ___playlistTracks!;
    ___playlistTracks = _i1.createRelationTable(
      relationFieldName: '__playlistTracks',
      field: Playlist.t.id,
      foreignField: _i2.PlaylistTrack.t.playlistId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PlaylistTrackTable(tableRelation: foreignTableRelation),
    );
    return ___playlistTracks!;
  }

  _i1.ManyRelation<_i2.PlaylistTrackTable> get playlistTracks {
    if (_playlistTracks != null) return _playlistTracks!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'playlistTracks',
      field: Playlist.t.id,
      foreignField: _i2.PlaylistTrack.t.playlistId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PlaylistTrackTable(tableRelation: foreignTableRelation),
    );
    _playlistTracks = _i1.ManyRelation<_i2.PlaylistTrackTable>(
      tableWithRelations: relationTable,
      table: _i2.PlaylistTrackTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _playlistTracks!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        createdAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'playlistTracks') {
      return __playlistTracks;
    }
    return null;
  }
}

class PlaylistInclude extends _i1.IncludeObject {
  PlaylistInclude._({_i2.PlaylistTrackIncludeList? playlistTracks}) {
    _playlistTracks = playlistTracks;
  }

  _i2.PlaylistTrackIncludeList? _playlistTracks;

  @override
  Map<String, _i1.Include?> get includes => {'playlistTracks': _playlistTracks};

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

  final attach = const PlaylistAttachRepository._();

  final attachRow = const PlaylistAttachRowRepository._();

  final detach = const PlaylistDetachRepository._();

  final detachRow = const PlaylistDetachRowRepository._();

  Future<List<Playlist>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaylistTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlaylistTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaylistTable>? orderByList,
    _i1.Transaction? transaction,
    PlaylistInclude? include,
  }) async {
    return session.db.find<Playlist>(
      where: where?.call(Playlist.t),
      orderBy: orderBy?.call(Playlist.t),
      orderByList: orderByList?.call(Playlist.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
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
    PlaylistInclude? include,
  }) async {
    return session.db.findFirstRow<Playlist>(
      where: where?.call(Playlist.t),
      orderBy: orderBy?.call(Playlist.t),
      orderByList: orderByList?.call(Playlist.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Playlist?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PlaylistInclude? include,
  }) async {
    return session.db.findById<Playlist>(
      id,
      transaction: transaction,
      include: include,
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

class PlaylistAttachRepository {
  const PlaylistAttachRepository._();

  Future<void> playlistTracks(
    _i1.Session session,
    Playlist playlist,
    List<_i2.PlaylistTrack> playlistTrack,
  ) async {
    if (playlistTrack.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playlistTrack.id');
    }
    if (playlist.id == null) {
      throw ArgumentError.notNull('playlist.id');
    }

    var $playlistTrack =
        playlistTrack.map((e) => e.copyWith(playlistId: playlist.id)).toList();
    await session.db.update<_i2.PlaylistTrack>(
      $playlistTrack,
      columns: [_i2.PlaylistTrack.t.playlistId],
    );
  }
}

class PlaylistAttachRowRepository {
  const PlaylistAttachRowRepository._();

  Future<void> playlistTracks(
    _i1.Session session,
    Playlist playlist,
    _i2.PlaylistTrack playlistTrack,
  ) async {
    if (playlistTrack.id == null) {
      throw ArgumentError.notNull('playlistTrack.id');
    }
    if (playlist.id == null) {
      throw ArgumentError.notNull('playlist.id');
    }

    var $playlistTrack = playlistTrack.copyWith(playlistId: playlist.id);
    await session.db.updateRow<_i2.PlaylistTrack>(
      $playlistTrack,
      columns: [_i2.PlaylistTrack.t.playlistId],
    );
  }
}

class PlaylistDetachRepository {
  const PlaylistDetachRepository._();

  Future<void> playlistTracks(
    _i1.Session session,
    List<_i2.PlaylistTrack> playlistTrack,
  ) async {
    if (playlistTrack.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playlistTrack.id');
    }

    var $playlistTrack =
        playlistTrack.map((e) => e.copyWith(playlistId: null)).toList();
    await session.db.update<_i2.PlaylistTrack>(
      $playlistTrack,
      columns: [_i2.PlaylistTrack.t.playlistId],
    );
  }
}

class PlaylistDetachRowRepository {
  const PlaylistDetachRowRepository._();

  Future<void> playlistTracks(
    _i1.Session session,
    _i2.PlaylistTrack playlistTrack,
  ) async {
    if (playlistTrack.id == null) {
      throw ArgumentError.notNull('playlistTrack.id');
    }

    var $playlistTrack = playlistTrack.copyWith(playlistId: null);
    await session.db.updateRow<_i2.PlaylistTrack>(
      $playlistTrack,
      columns: [_i2.PlaylistTrack.t.playlistId],
    );
  }
}
