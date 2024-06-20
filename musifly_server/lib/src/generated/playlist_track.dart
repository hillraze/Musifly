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

abstract class PlaylistTrack extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  PlaylistTrack._({
    int? id,
    required this.playlistId,
    this.playlist,
    required this.trackId,
    this.track,
  }) : super(id);

  factory PlaylistTrack({
    int? id,
    required int playlistId,
    _i2.Playlist? playlist,
    required int trackId,
    _i2.Track? track,
  }) = _PlaylistTrackImpl;

  factory PlaylistTrack.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlaylistTrack(
      id: jsonSerialization['id'] as int?,
      playlistId: jsonSerialization['playlistId'] as int,
      playlist: jsonSerialization['playlist'] == null
          ? null
          : _i2.Playlist.fromJson(
              (jsonSerialization['playlist'] as Map<String, dynamic>)),
      trackId: jsonSerialization['trackId'] as int,
      track: jsonSerialization['track'] == null
          ? null
          : _i2.Track.fromJson(
              (jsonSerialization['track'] as Map<String, dynamic>)),
    );
  }

  static final t = PlaylistTrackTable();

  static const db = PlaylistTrackRepository._();

  int playlistId;

  _i2.Playlist? playlist;

  int trackId;

  _i2.Track? track;

  @override
  _i1.Table get table => t;

  PlaylistTrack copyWith({
    int? id,
    int? playlistId,
    _i2.Playlist? playlist,
    int? trackId,
    _i2.Track? track,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'playlistId': playlistId,
      if (playlist != null) 'playlist': playlist?.toJson(),
      'trackId': trackId,
      if (track != null) 'track': track?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'playlistId': playlistId,
      if (playlist != null) 'playlist': playlist?.toJsonForProtocol(),
      'trackId': trackId,
      if (track != null) 'track': track?.toJsonForProtocol(),
    };
  }

  static PlaylistTrackInclude include({
    _i2.PlaylistInclude? playlist,
    _i2.TrackInclude? track,
  }) {
    return PlaylistTrackInclude._(
      playlist: playlist,
      track: track,
    );
  }

  static PlaylistTrackIncludeList includeList({
    _i1.WhereExpressionBuilder<PlaylistTrackTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlaylistTrackTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaylistTrackTable>? orderByList,
    PlaylistTrackInclude? include,
  }) {
    return PlaylistTrackIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlaylistTrack.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PlaylistTrack.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlaylistTrackImpl extends PlaylistTrack {
  _PlaylistTrackImpl({
    int? id,
    required int playlistId,
    _i2.Playlist? playlist,
    required int trackId,
    _i2.Track? track,
  }) : super._(
          id: id,
          playlistId: playlistId,
          playlist: playlist,
          trackId: trackId,
          track: track,
        );

  @override
  PlaylistTrack copyWith({
    Object? id = _Undefined,
    int? playlistId,
    Object? playlist = _Undefined,
    int? trackId,
    Object? track = _Undefined,
  }) {
    return PlaylistTrack(
      id: id is int? ? id : this.id,
      playlistId: playlistId ?? this.playlistId,
      playlist:
          playlist is _i2.Playlist? ? playlist : this.playlist?.copyWith(),
      trackId: trackId ?? this.trackId,
      track: track is _i2.Track? ? track : this.track?.copyWith(),
    );
  }
}

class PlaylistTrackTable extends _i1.Table {
  PlaylistTrackTable({super.tableRelation})
      : super(tableName: 'playlist_track') {
    playlistId = _i1.ColumnInt(
      'playlistId',
      this,
    );
    trackId = _i1.ColumnInt(
      'trackId',
      this,
    );
  }

  late final _i1.ColumnInt playlistId;

  _i2.PlaylistTable? _playlist;

  late final _i1.ColumnInt trackId;

  _i2.TrackTable? _track;

  _i2.PlaylistTable get playlist {
    if (_playlist != null) return _playlist!;
    _playlist = _i1.createRelationTable(
      relationFieldName: 'playlist',
      field: PlaylistTrack.t.playlistId,
      foreignField: _i2.Playlist.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PlaylistTable(tableRelation: foreignTableRelation),
    );
    return _playlist!;
  }

  _i2.TrackTable get track {
    if (_track != null) return _track!;
    _track = _i1.createRelationTable(
      relationFieldName: 'track',
      field: PlaylistTrack.t.trackId,
      foreignField: _i2.Track.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TrackTable(tableRelation: foreignTableRelation),
    );
    return _track!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        playlistId,
        trackId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'playlist') {
      return playlist;
    }
    if (relationField == 'track') {
      return track;
    }
    return null;
  }
}

class PlaylistTrackInclude extends _i1.IncludeObject {
  PlaylistTrackInclude._({
    _i2.PlaylistInclude? playlist,
    _i2.TrackInclude? track,
  }) {
    _playlist = playlist;
    _track = track;
  }

  _i2.PlaylistInclude? _playlist;

  _i2.TrackInclude? _track;

  @override
  Map<String, _i1.Include?> get includes => {
        'playlist': _playlist,
        'track': _track,
      };

  @override
  _i1.Table get table => PlaylistTrack.t;
}

class PlaylistTrackIncludeList extends _i1.IncludeList {
  PlaylistTrackIncludeList._({
    _i1.WhereExpressionBuilder<PlaylistTrackTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PlaylistTrack.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => PlaylistTrack.t;
}

class PlaylistTrackRepository {
  const PlaylistTrackRepository._();

  final attachRow = const PlaylistTrackAttachRowRepository._();

  Future<List<PlaylistTrack>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaylistTrackTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlaylistTrackTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaylistTrackTable>? orderByList,
    _i1.Transaction? transaction,
    PlaylistTrackInclude? include,
  }) async {
    return session.db.find<PlaylistTrack>(
      where: where?.call(PlaylistTrack.t),
      orderBy: orderBy?.call(PlaylistTrack.t),
      orderByList: orderByList?.call(PlaylistTrack.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<PlaylistTrack?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaylistTrackTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlaylistTrackTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaylistTrackTable>? orderByList,
    _i1.Transaction? transaction,
    PlaylistTrackInclude? include,
  }) async {
    return session.db.findFirstRow<PlaylistTrack>(
      where: where?.call(PlaylistTrack.t),
      orderBy: orderBy?.call(PlaylistTrack.t),
      orderByList: orderByList?.call(PlaylistTrack.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<PlaylistTrack?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PlaylistTrackInclude? include,
  }) async {
    return session.db.findById<PlaylistTrack>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<PlaylistTrack>> insert(
    _i1.Session session,
    List<PlaylistTrack> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PlaylistTrack>(
      rows,
      transaction: transaction,
    );
  }

  Future<PlaylistTrack> insertRow(
    _i1.Session session,
    PlaylistTrack row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PlaylistTrack>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PlaylistTrack>> update(
    _i1.Session session,
    List<PlaylistTrack> rows, {
    _i1.ColumnSelections<PlaylistTrackTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PlaylistTrack>(
      rows,
      columns: columns?.call(PlaylistTrack.t),
      transaction: transaction,
    );
  }

  Future<PlaylistTrack> updateRow(
    _i1.Session session,
    PlaylistTrack row, {
    _i1.ColumnSelections<PlaylistTrackTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PlaylistTrack>(
      row,
      columns: columns?.call(PlaylistTrack.t),
      transaction: transaction,
    );
  }

  Future<List<PlaylistTrack>> delete(
    _i1.Session session,
    List<PlaylistTrack> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PlaylistTrack>(
      rows,
      transaction: transaction,
    );
  }

  Future<PlaylistTrack> deleteRow(
    _i1.Session session,
    PlaylistTrack row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PlaylistTrack>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PlaylistTrack>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlaylistTrackTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PlaylistTrack>(
      where: where(PlaylistTrack.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaylistTrackTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PlaylistTrack>(
      where: where?.call(PlaylistTrack.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PlaylistTrackAttachRowRepository {
  const PlaylistTrackAttachRowRepository._();

  Future<void> playlist(
    _i1.Session session,
    PlaylistTrack playlistTrack,
    _i2.Playlist playlist,
  ) async {
    if (playlistTrack.id == null) {
      throw ArgumentError.notNull('playlistTrack.id');
    }
    if (playlist.id == null) {
      throw ArgumentError.notNull('playlist.id');
    }

    var $playlistTrack = playlistTrack.copyWith(playlistId: playlist.id);
    await session.db.updateRow<PlaylistTrack>(
      $playlistTrack,
      columns: [PlaylistTrack.t.playlistId],
    );
  }

  Future<void> track(
    _i1.Session session,
    PlaylistTrack playlistTrack,
    _i2.Track track,
  ) async {
    if (playlistTrack.id == null) {
      throw ArgumentError.notNull('playlistTrack.id');
    }
    if (track.id == null) {
      throw ArgumentError.notNull('track.id');
    }

    var $playlistTrack = playlistTrack.copyWith(trackId: track.id);
    await session.db.updateRow<PlaylistTrack>(
      $playlistTrack,
      columns: [PlaylistTrack.t.trackId],
    );
  }
}
