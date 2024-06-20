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
import 'artist.dart' as _i3;
import 'playlist.dart' as _i4;
import 'playlist_track.dart' as _i5;
import 'track.dart' as _i6;
import 'protocol.dart' as _i7;
import 'package:musifly_client/src/protocol/album.dart' as _i8;
import 'package:musifly_client/src/protocol/artist.dart' as _i9;
import 'package:musifly_client/src/protocol/playlist.dart' as _i10;
import 'package:musifly_client/src/protocol/playlist_track.dart' as _i11;
import 'package:musifly_client/src/protocol/track.dart' as _i12;
export 'album.dart';
export 'artist.dart';
export 'playlist.dart';
export 'playlist_track.dart';
export 'track.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Album) {
      return _i2.Album.fromJson(data) as T;
    }
    if (t == _i3.Artist) {
      return _i3.Artist.fromJson(data) as T;
    }
    if (t == _i4.Playlist) {
      return _i4.Playlist.fromJson(data) as T;
    }
    if (t == _i5.PlaylistTrack) {
      return _i5.PlaylistTrack.fromJson(data) as T;
    }
    if (t == _i6.Track) {
      return _i6.Track.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Album?>()) {
      return (data != null ? _i2.Album.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Artist?>()) {
      return (data != null ? _i3.Artist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Playlist?>()) {
      return (data != null ? _i4.Playlist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.PlaylistTrack?>()) {
      return (data != null ? _i5.PlaylistTrack.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Track?>()) {
      return (data != null ? _i6.Track.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i7.Track>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i7.Track>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i7.Album>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i7.Album>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i7.PlaylistTrack>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i7.PlaylistTrack>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i8.Album>) {
      return (data as List).map((e) => deserialize<_i8.Album>(e)).toList()
          as dynamic;
    }
    if (t == List<_i9.Artist>) {
      return (data as List).map((e) => deserialize<_i9.Artist>(e)).toList()
          as dynamic;
    }
    if (t == List<_i10.Playlist>) {
      return (data as List).map((e) => deserialize<_i10.Playlist>(e)).toList()
          as dynamic;
    }
    if (t == List<_i11.PlaylistTrack>) {
      return (data as List)
          .map((e) => deserialize<_i11.PlaylistTrack>(e))
          .toList() as dynamic;
    }
    if (t == List<_i12.Track>) {
      return (data as List).map((e) => deserialize<_i12.Track>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Album) {
      return 'Album';
    }
    if (data is _i3.Artist) {
      return 'Artist';
    }
    if (data is _i4.Playlist) {
      return 'Playlist';
    }
    if (data is _i5.PlaylistTrack) {
      return 'PlaylistTrack';
    }
    if (data is _i6.Track) {
      return 'Track';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Album') {
      return deserialize<_i2.Album>(data['data']);
    }
    if (data['className'] == 'Artist') {
      return deserialize<_i3.Artist>(data['data']);
    }
    if (data['className'] == 'Playlist') {
      return deserialize<_i4.Playlist>(data['data']);
    }
    if (data['className'] == 'PlaylistTrack') {
      return deserialize<_i5.PlaylistTrack>(data['data']);
    }
    if (data['className'] == 'Track') {
      return deserialize<_i6.Track>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
