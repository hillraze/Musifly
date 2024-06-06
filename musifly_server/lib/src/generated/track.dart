/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Track extends _i1.TableRow implements _i1.ProtocolSerialization {
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

  factory Track.fromJson(Map<String, dynamic> jsonSerialization) {
    return Track(
      id: jsonSerialization['id'] as int?,
      artist: jsonSerialization['artist'] as String,
      audioLink: jsonSerialization['audioLink'] as String,
      cover: jsonSerialization['cover'] as String,
      genre: jsonSerialization['genre'] as String,
      title: jsonSerialization['title'] as String,
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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'artist': artist,
      'audioLink': audioLink,
      'cover': cover,
      'genre': genre,
      'title': title,
    };
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

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
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
    return session.db.find<Track>(
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
    return session.db.findFirstRow<Track>(
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
    return session.db.findById<Track>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Track>> insert(
    _i1.Session session,
    List<Track> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Track>(
      rows,
      transaction: transaction,
    );
  }

  Future<Track> insertRow(
    _i1.Session session,
    Track row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Track>(
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
    return session.db.update<Track>(
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
    return session.db.updateRow<Track>(
      row,
      columns: columns?.call(Track.t),
      transaction: transaction,
    );
  }

  Future<List<Track>> delete(
    _i1.Session session,
    List<Track> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Track>(
      rows,
      transaction: transaction,
    );
  }

  Future<Track> deleteRow(
    _i1.Session session,
    Track row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Track>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Track>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TrackTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Track>(
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
    return session.db.count<Track>(
      where: where?.call(Track.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
