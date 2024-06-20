/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'album.dart' as _i3;
import 'artist.dart' as _i4;
import 'playlist.dart' as _i5;
import 'playlist_track.dart' as _i6;
import 'track.dart' as _i7;
import 'protocol.dart' as _i8;
import 'package:musifly_server/src/generated/album.dart' as _i9;
import 'package:musifly_server/src/generated/artist.dart' as _i10;
import 'package:musifly_server/src/generated/playlist.dart' as _i11;
import 'package:musifly_server/src/generated/playlist_track.dart' as _i12;
import 'package:musifly_server/src/generated/track.dart' as _i13;
export 'album.dart';
export 'artist.dart';
export 'playlist.dart';
export 'playlist_track.dart';
export 'track.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'album',
      dartName: 'Album',
      schema: 'public',
      module: 'musifly',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'album_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'genre',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'coverUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'artistId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'releasedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'album_fk_0',
          columns: ['artistId'],
          referenceTable: 'artist',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'album_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'artist',
      dartName: 'Artist',
      schema: 'public',
      module: 'musifly',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'artist_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'bio',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'artist_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'playlist',
      dartName: 'Playlist',
      schema: 'public',
      module: 'musifly',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'playlist_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'playlist_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'playlist_track',
      dartName: 'PlaylistTrack',
      schema: 'public',
      module: 'musifly',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'playlist_track_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'playlistId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'trackId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'playlist_track_fk_0',
          columns: ['playlistId'],
          referenceTable: 'playlist',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'playlist_track_fk_1',
          columns: ['trackId'],
          referenceTable: 'track',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'playlist_track_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'track',
      dartName: 'Track',
      schema: 'public',
      module: 'musifly',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'track_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'albumId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'artistId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'audioUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'track_fk_0',
          columns: ['albumId'],
          referenceTable: 'album',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'track_fk_1',
          columns: ['artistId'],
          referenceTable: 'artist',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'track_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.Album) {
      return _i3.Album.fromJson(data) as T;
    }
    if (t == _i4.Artist) {
      return _i4.Artist.fromJson(data) as T;
    }
    if (t == _i5.Playlist) {
      return _i5.Playlist.fromJson(data) as T;
    }
    if (t == _i6.PlaylistTrack) {
      return _i6.PlaylistTrack.fromJson(data) as T;
    }
    if (t == _i7.Track) {
      return _i7.Track.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.Album?>()) {
      return (data != null ? _i3.Album.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Artist?>()) {
      return (data != null ? _i4.Artist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Playlist?>()) {
      return (data != null ? _i5.Playlist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.PlaylistTrack?>()) {
      return (data != null ? _i6.PlaylistTrack.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Track?>()) {
      return (data != null ? _i7.Track.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i8.Track>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i8.Track>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i8.Album>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i8.Album>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i8.PlaylistTrack>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i8.PlaylistTrack>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i9.Album>) {
      return (data as List).map((e) => deserialize<_i9.Album>(e)).toList()
          as dynamic;
    }
    if (t == List<_i10.Artist>) {
      return (data as List).map((e) => deserialize<_i10.Artist>(e)).toList()
          as dynamic;
    }
    if (t == List<_i11.Playlist>) {
      return (data as List).map((e) => deserialize<_i11.Playlist>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.PlaylistTrack>) {
      return (data as List)
          .map((e) => deserialize<_i12.PlaylistTrack>(e))
          .toList() as dynamic;
    }
    if (t == List<_i13.Track>) {
      return (data as List).map((e) => deserialize<_i13.Track>(e)).toList()
          as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.Album) {
      return 'Album';
    }
    if (data is _i4.Artist) {
      return 'Artist';
    }
    if (data is _i5.Playlist) {
      return 'Playlist';
    }
    if (data is _i6.PlaylistTrack) {
      return 'PlaylistTrack';
    }
    if (data is _i7.Track) {
      return 'Track';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Album') {
      return deserialize<_i3.Album>(data['data']);
    }
    if (data['className'] == 'Artist') {
      return deserialize<_i4.Artist>(data['data']);
    }
    if (data['className'] == 'Playlist') {
      return deserialize<_i5.Playlist>(data['data']);
    }
    if (data['className'] == 'PlaylistTrack') {
      return deserialize<_i6.PlaylistTrack>(data['data']);
    }
    if (data['className'] == 'Track') {
      return deserialize<_i7.Track>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i3.Album:
        return _i3.Album.t;
      case _i4.Artist:
        return _i4.Artist.t;
      case _i5.Playlist:
        return _i5.Playlist.t;
      case _i6.PlaylistTrack:
        return _i6.PlaylistTrack.t;
      case _i7.Track:
        return _i7.Track.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'musifly';
}
