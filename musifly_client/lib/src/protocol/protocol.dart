/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'album.dart' as _i2;
import 'song.dart' as _i3;
import 'protocol.dart' as _i4;
import 'package:musifly_client/src/protocol/album.dart' as _i5;
import 'package:musifly_client/src/protocol/song.dart' as _i6;
export 'album.dart';
export 'song.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Album) {
      return _i2.Album.fromJson(data, this) as T;
    }
    if (t == _i3.Song) {
      return _i3.Song.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Album?>()) {
      return (data != null ? _i2.Album.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Song?>()) {
      return (data != null ? _i3.Song.fromJson(data, this) : null) as T;
    }
    if (t == List<_i4.Song>) {
      return (data as List).map((e) => deserialize<_i4.Song>(e)).toList()
          as dynamic;
    }
    if (t == List<_i5.Album>) {
      return (data as List).map((e) => deserialize<_i5.Album>(e)).toList()
          as dynamic;
    }
    if (t == List<_i6.Song>) {
      return (data as List).map((e) => deserialize<_i6.Song>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Album) {
      return 'Album';
    }
    if (data is _i3.Song) {
      return 'Song';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Album') {
      return deserialize<_i2.Album>(data['data']);
    }
    if (data['className'] == 'Song') {
      return deserialize<_i3.Song>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
