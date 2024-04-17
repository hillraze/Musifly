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
import 'song.dart' as _i4;
import 'protocol.dart' as _i5;
import 'package:musifly_server/src/generated/album.dart' as _i6;
import 'package:musifly_server/src/generated/song.dart' as _i7;
export 'album.dart';
export 'song.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    ..._i2.Protocol.targetTableDefinitions
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i3.Album) {
      return _i3.Album.fromJson(data, this) as T;
    }
    if (t == _i4.Song) {
      return _i4.Song.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.Album?>()) {
      return (data != null ? _i3.Album.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.Song?>()) {
      return (data != null ? _i4.Song.fromJson(data, this) : null) as T;
    }
    if (t == List<_i5.Song>) {
      return (data as List).map((e) => deserialize<_i5.Song>(e)).toList()
          as dynamic;
    }
    if (t == List<_i6.Album>) {
      return (data as List).map((e) => deserialize<_i6.Album>(e)).toList()
          as dynamic;
    }
    if (t == List<_i7.Song>) {
      return (data as List).map((e) => deserialize<_i7.Song>(e)).toList()
          as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.Album) {
      return 'Album';
    }
    if (data is _i4.Song) {
      return 'Song';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Album') {
      return deserialize<_i3.Album>(data['data']);
    }
    if (data['className'] == 'Song') {
      return deserialize<_i4.Song>(data['data']);
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
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'musifly';
}
