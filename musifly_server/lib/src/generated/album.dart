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

abstract class Album extends _i1.TableRow implements _i1.ProtocolSerialization {
  Album._({
    int? id,
    required this.title,
    this.genre,
    this.coverUrl,
    required this.artistId,
    this.artist,
    this.tracks,
    this.releasedAt,
  }) : super(id);

  factory Album({
    int? id,
    required String title,
    String? genre,
    String? coverUrl,
    required int artistId,
    _i2.Artist? artist,
    List<_i2.Track>? tracks,
    DateTime? releasedAt,
  }) = _AlbumImpl;

  factory Album.fromJson(Map<String, dynamic> jsonSerialization) {
    return Album(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      genre: jsonSerialization['genre'] as String?,
      coverUrl: jsonSerialization['coverUrl'] as String?,
      artistId: jsonSerialization['artistId'] as int,
      artist: jsonSerialization['artist'] == null
          ? null
          : _i2.Artist.fromJson(
              (jsonSerialization['artist'] as Map<String, dynamic>)),
      tracks: (jsonSerialization['tracks'] as List?)
          ?.map((e) => _i2.Track.fromJson((e as Map<String, dynamic>)))
          .toList(),
      releasedAt: jsonSerialization['releasedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['releasedAt']),
    );
  }

  static final t = AlbumTable();

  static const db = AlbumRepository._();

  String title;

  String? genre;

  String? coverUrl;

  int artistId;

  _i2.Artist? artist;

  List<_i2.Track>? tracks;

  DateTime? releasedAt;

  @override
  _i1.Table get table => t;

  Album copyWith({
    int? id,
    String? title,
    String? genre,
    String? coverUrl,
    int? artistId,
    _i2.Artist? artist,
    List<_i2.Track>? tracks,
    DateTime? releasedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      if (genre != null) 'genre': genre,
      if (coverUrl != null) 'coverUrl': coverUrl,
      'artistId': artistId,
      if (artist != null) 'artist': artist?.toJson(),
      if (tracks != null)
        'tracks': tracks?.toJson(valueToJson: (v) => v.toJson()),
      if (releasedAt != null) 'releasedAt': releasedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      if (genre != null) 'genre': genre,
      if (coverUrl != null) 'coverUrl': coverUrl,
      'artistId': artistId,
      if (artist != null) 'artist': artist?.toJsonForProtocol(),
      if (tracks != null)
        'tracks': tracks?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (releasedAt != null) 'releasedAt': releasedAt?.toJson(),
    };
  }

  static AlbumInclude include({
    _i2.ArtistInclude? artist,
    _i2.TrackIncludeList? tracks,
  }) {
    return AlbumInclude._(
      artist: artist,
      tracks: tracks,
    );
  }

  static AlbumIncludeList includeList({
    _i1.WhereExpressionBuilder<AlbumTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AlbumTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AlbumTable>? orderByList,
    AlbumInclude? include,
  }) {
    return AlbumIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Album.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Album.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AlbumImpl extends Album {
  _AlbumImpl({
    int? id,
    required String title,
    String? genre,
    String? coverUrl,
    required int artistId,
    _i2.Artist? artist,
    List<_i2.Track>? tracks,
    DateTime? releasedAt,
  }) : super._(
          id: id,
          title: title,
          genre: genre,
          coverUrl: coverUrl,
          artistId: artistId,
          artist: artist,
          tracks: tracks,
          releasedAt: releasedAt,
        );

  @override
  Album copyWith({
    Object? id = _Undefined,
    String? title,
    Object? genre = _Undefined,
    Object? coverUrl = _Undefined,
    int? artistId,
    Object? artist = _Undefined,
    Object? tracks = _Undefined,
    Object? releasedAt = _Undefined,
  }) {
    return Album(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      genre: genre is String? ? genre : this.genre,
      coverUrl: coverUrl is String? ? coverUrl : this.coverUrl,
      artistId: artistId ?? this.artistId,
      artist: artist is _i2.Artist? ? artist : this.artist?.copyWith(),
      tracks: tracks is List<_i2.Track>? ? tracks : this.tracks?.clone(),
      releasedAt: releasedAt is DateTime? ? releasedAt : this.releasedAt,
    );
  }
}

class AlbumTable extends _i1.Table {
  AlbumTable({super.tableRelation}) : super(tableName: 'album') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    genre = _i1.ColumnString(
      'genre',
      this,
    );
    coverUrl = _i1.ColumnString(
      'coverUrl',
      this,
    );
    artistId = _i1.ColumnInt(
      'artistId',
      this,
    );
    releasedAt = _i1.ColumnDateTime(
      'releasedAt',
      this,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnString genre;

  late final _i1.ColumnString coverUrl;

  late final _i1.ColumnInt artistId;

  _i2.ArtistTable? _artist;

  _i2.TrackTable? ___tracks;

  _i1.ManyRelation<_i2.TrackTable>? _tracks;

  late final _i1.ColumnDateTime releasedAt;

  _i2.ArtistTable get artist {
    if (_artist != null) return _artist!;
    _artist = _i1.createRelationTable(
      relationFieldName: 'artist',
      field: Album.t.artistId,
      foreignField: _i2.Artist.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtistTable(tableRelation: foreignTableRelation),
    );
    return _artist!;
  }

  _i2.TrackTable get __tracks {
    if (___tracks != null) return ___tracks!;
    ___tracks = _i1.createRelationTable(
      relationFieldName: '__tracks',
      field: Album.t.id,
      foreignField: _i2.Track.t.albumId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TrackTable(tableRelation: foreignTableRelation),
    );
    return ___tracks!;
  }

  _i1.ManyRelation<_i2.TrackTable> get tracks {
    if (_tracks != null) return _tracks!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'tracks',
      field: Album.t.id,
      foreignField: _i2.Track.t.albumId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TrackTable(tableRelation: foreignTableRelation),
    );
    _tracks = _i1.ManyRelation<_i2.TrackTable>(
      tableWithRelations: relationTable,
      table: _i2.TrackTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _tracks!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        genre,
        coverUrl,
        artistId,
        releasedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'artist') {
      return artist;
    }
    if (relationField == 'tracks') {
      return __tracks;
    }
    return null;
  }
}

class AlbumInclude extends _i1.IncludeObject {
  AlbumInclude._({
    _i2.ArtistInclude? artist,
    _i2.TrackIncludeList? tracks,
  }) {
    _artist = artist;
    _tracks = tracks;
  }

  _i2.ArtistInclude? _artist;

  _i2.TrackIncludeList? _tracks;

  @override
  Map<String, _i1.Include?> get includes => {
        'artist': _artist,
        'tracks': _tracks,
      };

  @override
  _i1.Table get table => Album.t;
}

class AlbumIncludeList extends _i1.IncludeList {
  AlbumIncludeList._({
    _i1.WhereExpressionBuilder<AlbumTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Album.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Album.t;
}

class AlbumRepository {
  const AlbumRepository._();

  final attach = const AlbumAttachRepository._();

  final attachRow = const AlbumAttachRowRepository._();

  final detach = const AlbumDetachRepository._();

  final detachRow = const AlbumDetachRowRepository._();

  Future<List<Album>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AlbumTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AlbumTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AlbumTable>? orderByList,
    _i1.Transaction? transaction,
    AlbumInclude? include,
  }) async {
    return session.db.find<Album>(
      where: where?.call(Album.t),
      orderBy: orderBy?.call(Album.t),
      orderByList: orderByList?.call(Album.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Album?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AlbumTable>? where,
    int? offset,
    _i1.OrderByBuilder<AlbumTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AlbumTable>? orderByList,
    _i1.Transaction? transaction,
    AlbumInclude? include,
  }) async {
    return session.db.findFirstRow<Album>(
      where: where?.call(Album.t),
      orderBy: orderBy?.call(Album.t),
      orderByList: orderByList?.call(Album.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Album?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AlbumInclude? include,
  }) async {
    return session.db.findById<Album>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Album>> insert(
    _i1.Session session,
    List<Album> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Album>(
      rows,
      transaction: transaction,
    );
  }

  Future<Album> insertRow(
    _i1.Session session,
    Album row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Album>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Album>> update(
    _i1.Session session,
    List<Album> rows, {
    _i1.ColumnSelections<AlbumTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Album>(
      rows,
      columns: columns?.call(Album.t),
      transaction: transaction,
    );
  }

  Future<Album> updateRow(
    _i1.Session session,
    Album row, {
    _i1.ColumnSelections<AlbumTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Album>(
      row,
      columns: columns?.call(Album.t),
      transaction: transaction,
    );
  }

  Future<List<Album>> delete(
    _i1.Session session,
    List<Album> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Album>(
      rows,
      transaction: transaction,
    );
  }

  Future<Album> deleteRow(
    _i1.Session session,
    Album row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Album>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Album>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AlbumTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Album>(
      where: where(Album.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AlbumTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Album>(
      where: where?.call(Album.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AlbumAttachRepository {
  const AlbumAttachRepository._();

  Future<void> tracks(
    _i1.Session session,
    Album album,
    List<_i2.Track> track,
  ) async {
    if (track.any((e) => e.id == null)) {
      throw ArgumentError.notNull('track.id');
    }
    if (album.id == null) {
      throw ArgumentError.notNull('album.id');
    }

    var $track = track.map((e) => e.copyWith(albumId: album.id)).toList();
    await session.db.update<_i2.Track>(
      $track,
      columns: [_i2.Track.t.albumId],
    );
  }
}

class AlbumAttachRowRepository {
  const AlbumAttachRowRepository._();

  Future<void> artist(
    _i1.Session session,
    Album album,
    _i2.Artist artist,
  ) async {
    if (album.id == null) {
      throw ArgumentError.notNull('album.id');
    }
    if (artist.id == null) {
      throw ArgumentError.notNull('artist.id');
    }

    var $album = album.copyWith(artistId: artist.id);
    await session.db.updateRow<Album>(
      $album,
      columns: [Album.t.artistId],
    );
  }

  Future<void> tracks(
    _i1.Session session,
    Album album,
    _i2.Track track,
  ) async {
    if (track.id == null) {
      throw ArgumentError.notNull('track.id');
    }
    if (album.id == null) {
      throw ArgumentError.notNull('album.id');
    }

    var $track = track.copyWith(albumId: album.id);
    await session.db.updateRow<_i2.Track>(
      $track,
      columns: [_i2.Track.t.albumId],
    );
  }
}

class AlbumDetachRepository {
  const AlbumDetachRepository._();

  Future<void> tracks(
    _i1.Session session,
    List<_i2.Track> track,
  ) async {
    if (track.any((e) => e.id == null)) {
      throw ArgumentError.notNull('track.id');
    }

    var $track = track.map((e) => e.copyWith(albumId: null)).toList();
    await session.db.update<_i2.Track>(
      $track,
      columns: [_i2.Track.t.albumId],
    );
  }
}

class AlbumDetachRowRepository {
  const AlbumDetachRowRepository._();

  Future<void> tracks(
    _i1.Session session,
    _i2.Track track,
  ) async {
    if (track.id == null) {
      throw ArgumentError.notNull('track.id');
    }

    var $track = track.copyWith(albumId: null);
    await session.db.updateRow<_i2.Track>(
      $track,
      columns: [_i2.Track.t.albumId],
    );
  }
}
