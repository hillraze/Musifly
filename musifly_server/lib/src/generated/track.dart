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

abstract class Track extends _i1.TableRow implements _i1.ProtocolSerialization {
  Track._({
    int? id,
    required this.albumId,
    this.album,
    required this.artistId,
    this.artist,
    required this.title,
    required this.audioUrl,
  }) : super(id);

  factory Track({
    int? id,
    required int albumId,
    _i2.Album? album,
    required int artistId,
    _i2.Artist? artist,
    required String title,
    required String audioUrl,
  }) = _TrackImpl;

  factory Track.fromJson(Map<String, dynamic> jsonSerialization) {
    return Track(
      id: jsonSerialization['id'] as int?,
      albumId: jsonSerialization['albumId'] as int,
      album: jsonSerialization['album'] == null
          ? null
          : _i2.Album.fromJson(
              (jsonSerialization['album'] as Map<String, dynamic>)),
      artistId: jsonSerialization['artistId'] as int,
      artist: jsonSerialization['artist'] == null
          ? null
          : _i2.Artist.fromJson(
              (jsonSerialization['artist'] as Map<String, dynamic>)),
      title: jsonSerialization['title'] as String,
      audioUrl: jsonSerialization['audioUrl'] as String,
    );
  }

  static final t = TrackTable();

  static const db = TrackRepository._();

  int albumId;

  _i2.Album? album;

  int artistId;

  _i2.Artist? artist;

  String title;

  String audioUrl;

  @override
  _i1.Table get table => t;

  Track copyWith({
    int? id,
    int? albumId,
    _i2.Album? album,
    int? artistId,
    _i2.Artist? artist,
    String? title,
    String? audioUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'albumId': albumId,
      if (album != null) 'album': album?.toJson(),
      'artistId': artistId,
      if (artist != null) 'artist': artist?.toJson(),
      'title': title,
      'audioUrl': audioUrl,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'albumId': albumId,
      if (album != null) 'album': album?.toJsonForProtocol(),
      'artistId': artistId,
      if (artist != null) 'artist': artist?.toJsonForProtocol(),
      'title': title,
      'audioUrl': audioUrl,
    };
  }

  static TrackInclude include({
    _i2.AlbumInclude? album,
    _i2.ArtistInclude? artist,
  }) {
    return TrackInclude._(
      album: album,
      artist: artist,
    );
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
    required int albumId,
    _i2.Album? album,
    required int artistId,
    _i2.Artist? artist,
    required String title,
    required String audioUrl,
  }) : super._(
          id: id,
          albumId: albumId,
          album: album,
          artistId: artistId,
          artist: artist,
          title: title,
          audioUrl: audioUrl,
        );

  @override
  Track copyWith({
    Object? id = _Undefined,
    int? albumId,
    Object? album = _Undefined,
    int? artistId,
    Object? artist = _Undefined,
    String? title,
    String? audioUrl,
  }) {
    return Track(
      id: id is int? ? id : this.id,
      albumId: albumId ?? this.albumId,
      album: album is _i2.Album? ? album : this.album?.copyWith(),
      artistId: artistId ?? this.artistId,
      artist: artist is _i2.Artist? ? artist : this.artist?.copyWith(),
      title: title ?? this.title,
      audioUrl: audioUrl ?? this.audioUrl,
    );
  }
}

class TrackTable extends _i1.Table {
  TrackTable({super.tableRelation}) : super(tableName: 'track') {
    albumId = _i1.ColumnInt(
      'albumId',
      this,
    );
    artistId = _i1.ColumnInt(
      'artistId',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    audioUrl = _i1.ColumnString(
      'audioUrl',
      this,
    );
  }

  late final _i1.ColumnInt albumId;

  _i2.AlbumTable? _album;

  late final _i1.ColumnInt artistId;

  _i2.ArtistTable? _artist;

  late final _i1.ColumnString title;

  late final _i1.ColumnString audioUrl;

  _i2.AlbumTable get album {
    if (_album != null) return _album!;
    _album = _i1.createRelationTable(
      relationFieldName: 'album',
      field: Track.t.albumId,
      foreignField: _i2.Album.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AlbumTable(tableRelation: foreignTableRelation),
    );
    return _album!;
  }

  _i2.ArtistTable get artist {
    if (_artist != null) return _artist!;
    _artist = _i1.createRelationTable(
      relationFieldName: 'artist',
      field: Track.t.artistId,
      foreignField: _i2.Artist.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtistTable(tableRelation: foreignTableRelation),
    );
    return _artist!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        albumId,
        artistId,
        title,
        audioUrl,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'album') {
      return album;
    }
    if (relationField == 'artist') {
      return artist;
    }
    return null;
  }
}

class TrackInclude extends _i1.IncludeObject {
  TrackInclude._({
    _i2.AlbumInclude? album,
    _i2.ArtistInclude? artist,
  }) {
    _album = album;
    _artist = artist;
  }

  _i2.AlbumInclude? _album;

  _i2.ArtistInclude? _artist;

  @override
  Map<String, _i1.Include?> get includes => {
        'album': _album,
        'artist': _artist,
      };

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

  final attachRow = const TrackAttachRowRepository._();

  Future<List<Track>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TrackTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TrackTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TrackTable>? orderByList,
    _i1.Transaction? transaction,
    TrackInclude? include,
  }) async {
    return session.db.find<Track>(
      where: where?.call(Track.t),
      orderBy: orderBy?.call(Track.t),
      orderByList: orderByList?.call(Track.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
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
    TrackInclude? include,
  }) async {
    return session.db.findFirstRow<Track>(
      where: where?.call(Track.t),
      orderBy: orderBy?.call(Track.t),
      orderByList: orderByList?.call(Track.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Track?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    TrackInclude? include,
  }) async {
    return session.db.findById<Track>(
      id,
      transaction: transaction,
      include: include,
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

class TrackAttachRowRepository {
  const TrackAttachRowRepository._();

  Future<void> album(
    _i1.Session session,
    Track track,
    _i2.Album album,
  ) async {
    if (track.id == null) {
      throw ArgumentError.notNull('track.id');
    }
    if (album.id == null) {
      throw ArgumentError.notNull('album.id');
    }

    var $track = track.copyWith(albumId: album.id);
    await session.db.updateRow<Track>(
      $track,
      columns: [Track.t.albumId],
    );
  }

  Future<void> artist(
    _i1.Session session,
    Track track,
    _i2.Artist artist,
  ) async {
    if (track.id == null) {
      throw ArgumentError.notNull('track.id');
    }
    if (artist.id == null) {
      throw ArgumentError.notNull('artist.id');
    }

    var $track = track.copyWith(artistId: artist.id);
    await session.db.updateRow<Track>(
      $track,
      columns: [Track.t.artistId],
    );
  }
}
