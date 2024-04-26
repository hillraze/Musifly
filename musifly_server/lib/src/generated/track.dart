/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Track extends _i1.TableRow {
  Track._({
    int? id,
    required this.artist,
    required this.audioLink,
    required this.cover,
    required this.genre,
    required this.title,
  }) : super(id);

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

  static final t = TrackTable();

  static const db = TrackRepository._();

  String artist;

  String audioLink;

  String cover;

  String genre;

  String title;

  @override
  _i1.Table get table => t;

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

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'artist': artist,
      'audioLink': audioLink,
      'cover': cover,
      'genre': genre,
      'title': title,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'artist': artist,
      'audioLink': audioLink,
      'cover': cover,
      'genre': genre,
      'title': title,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'artist':
        artist = value;
        return;
      case 'audioLink':
        audioLink = value;
        return;
      case 'cover':
        cover = value;
        return;
      case 'genre':
        genre = value;
        return;
      case 'title':
        title = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Track>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TrackTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Track>(
      where: where != null ? where(Track.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<Track?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TrackTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Track>(
      where: where != null ? where(Track.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Track?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Track>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TrackTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Track>(
      where: where(Track.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Track row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.update instead.')
  static Future<bool> update(
    _i1.Session session,
    Track row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  @Deprecated(
      'Will be removed in 2.0.0. Use: db.insert instead. Important note: In db.insert, the object you pass in is no longer modified, instead a new copy with the added row is returned which contains the inserted id.')
  static Future<void> insert(
    _i1.Session session,
    Track row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.count instead.')
  static Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TrackTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Track>(
      where: where != null ? where(Track.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static TrackInclude include() {
    return TrackInclude._();
  }

  static TrackIncludeList includeList({
    _i1.WhereExpressionBuilder<TrackTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TrackTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TrackTable>? orderByList,
    TrackInclude? include,
  }) {
    return TrackIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Track.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Track.t),
      include: include,
    );
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

class TrackTable extends _i1.Table {
  TrackTable({super.tableRelation}) : super(tableName: 'tracks') {
    artist = _i1.ColumnString(
      'artist',
      this,
    );
    audioLink = _i1.ColumnString(
      'audioLink',
      this,
    );
    cover = _i1.ColumnString(
      'cover',
      this,
    );
    genre = _i1.ColumnString(
      'genre',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
  }

  late final _i1.ColumnString artist;

  late final _i1.ColumnString audioLink;

  late final _i1.ColumnString cover;

  late final _i1.ColumnString genre;

  late final _i1.ColumnString title;

  @override
  List<_i1.Column> get columns => [
        id,
        artist,
        audioLink,
        cover,
        genre,
        title,
      ];
}

@Deprecated('Use TrackTable.t instead.')
TrackTable tTrack = TrackTable();

class TrackInclude extends _i1.IncludeObject {
  TrackInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Track.t;
}

class TrackIncludeList extends _i1.IncludeList {
  TrackIncludeList._({
    _i1.WhereExpressionBuilder<TrackTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Track.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Track.t;
}

class TrackRepository {
  const TrackRepository._();

  Future<List<Track>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TrackTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TrackTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TrackTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<Track>(
      where: where?.call(Track.t),
      orderBy: orderBy?.call(Track.t),
      orderByList: orderByList?.call(Track.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Track?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TrackTable>? where,
    int? offset,
    _i1.OrderByBuilder<TrackTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TrackTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<Track>(
      where: where?.call(Track.t),
      orderBy: orderBy?.call(Track.t),
      orderByList: orderByList?.call(Track.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Track?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<Track>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Track>> insert(
    _i1.Session session,
    List<Track> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Track>(
      rows,
      transaction: transaction,
    );
  }

  Future<Track> insertRow(
    _i1.Session session,
    Track row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Track>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Track>> update(
    _i1.Session session,
    List<Track> rows, {
    _i1.ColumnSelections<TrackTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Track>(
      rows,
      columns: columns?.call(Track.t),
      transaction: transaction,
    );
  }

  Future<Track> updateRow(
    _i1.Session session,
    Track row, {
    _i1.ColumnSelections<TrackTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Track>(
      row,
      columns: columns?.call(Track.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Track> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Track>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Track row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Track>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TrackTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Track>(
      where: where(Track.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TrackTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Track>(
      where: where?.call(Track.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
