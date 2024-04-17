/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:musifly_client/src/protocol/album.dart' as _i3;
import 'package:musifly_client/src/protocol/song.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointAlbum extends _i1.EndpointRef {
  EndpointAlbum(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'album';

  _i2.Future<List<_i3.Album>> getNewAlbums() =>
      caller.callServerEndpoint<List<_i3.Album>>(
        'album',
        'getNewAlbums',
        {},
      );
}

/// {@category Endpoint}
class EndpointSong extends _i1.EndpointRef {
  EndpointSong(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'song';

  _i2.Future<List<_i4.Song>> getNewSongs() =>
      caller.callServerEndpoint<List<_i4.Song>>(
        'song',
        'getNewSongs',
        {},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    album = EndpointAlbum(this);
    song = EndpointSong(this);
  }

  late final EndpointAlbum album;

  late final EndpointSong song;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'album': album,
        'song': song,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
