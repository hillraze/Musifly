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
import 'playlist.dart' as _i4;
import 'track.dart' as _i5;
import 'protocol.dart' as _i6;
import 'package:musifly_server/src/generated/album.dart' as _i7;
import 'package:musifly_server/src/generated/track.dart' as _i8;
export 'album.dart';
export 'playlist.dart';
export 'track.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'playlists',
      dartName: 'Playlist',
      schema: 'public',
      module: 'musifly',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'playlists_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isPublic',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'tracks',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:Track>',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'playlists_pkey',
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
      name: 'tracks',
      dartName: 'Track',
      schema: 'public',
      module: 'musifly',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'tracks_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'artist',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'audioLink',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'cover',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'genre',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'tracks_pkey',
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
    if (t == _i4.Playlist) {
      return _i4.Playlist.fromJson(data) as T;
    }
    if (t == _i5.Track) {
      return _i5.Track.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.Album?>()) {
      return (data != null ? _i3.Album.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Playlist?>()) {
      return (data != null ? _i4.Playlist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Track?>()) {
      return (data != null ? _i5.Track.fromJson(data) : null) as T;
    }
    if (t == List<_i6.Track>) {
      return (data as List).map((e) => deserialize<_i6.Track>(e)).toList()
          as dynamic;
    }
    if (t == List<_i7.Album>) {
      return (data as List).map((e) => deserialize<_i7.Album>(e)).toList()
          as dynamic;
    }
    if (t == List<_i8.Track>) {
      return (data as List).map((e) => deserialize<_i8.Track>(e)).toList()
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
    if (data is _i4.Playlist) {
      return 'Playlist';
    }
    if (data is _i5.Track) {
      return 'Track';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Album') {
      return deserialize<_i3.Album>(data['data']);
    }
    if (data['className'] == 'Playlist') {
      return deserialize<_i4.Playlist>(data['data']);
    }
    if (data['className'] == 'Track') {
      return deserialize<_i5.Track>(data['data']);
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
      case _i4.Playlist:
        return _i4.Playlist.t;
      case _i5.Track:
        return _i5.Track.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'musifly';
}
