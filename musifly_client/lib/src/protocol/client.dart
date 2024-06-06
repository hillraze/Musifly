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
import 'package:musifly_client/src/protocol/playlist.dart' as _i4;
import 'package:musifly_client/src/protocol/track.dart' as _i5;
import 'protocol.dart' as _i6;

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
class EndpointPlaylistEndpoints extends _i1.EndpointRef {
  EndpointPlaylistEndpoints(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'playlistEndpoints';

  _i2.Future<_i4.Playlist> createPlaylist({
    required String name,
    required String userId,
    required bool isPublic,
  }) =>
      caller.callServerEndpoint<_i4.Playlist>(
        'playlistEndpoints',
        'createPlaylist',
        {
          'name': name,
          'userId': userId,
          'isPublic': isPublic,
        },
      );

  /// Update Playlist with new trackIds
  _i2.Future<_i4.Playlist> addTrack({
    required int playlistId,
    required int trackId,
  }) =>
      caller.callServerEndpoint<_i4.Playlist>(
        'playlistEndpoints',
        'addTrack',
        {
          'playlistId': playlistId,
          'trackId': trackId,
        },
      );

  _i2.Future<_i4.Playlist> getPlaylist(int id) =>
      caller.callServerEndpoint<_i4.Playlist>(
        'playlistEndpoints',
        'getPlaylist',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointTrack extends _i1.EndpointRef {
  EndpointTrack(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'track';

  /// Get a Track by ID
  /// @param id The ID of the Track
  _i2.Future<_i5.Track> getTrack(int id) =>
      caller.callServerEndpoint<_i5.Track>(
        'track',
        'getTrack',
        {'id': id},
      );

  _i2.Future<List<_i5.Track>> getNewTracks() =>
      caller.callServerEndpoint<List<_i5.Track>>(
        'track',
        'getNewTracks',
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
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    album = EndpointAlbum(this);
    playlistEndpoints = EndpointPlaylistEndpoints(this);
    track = EndpointTrack(this);
  }

  late final EndpointAlbum album;

  late final EndpointPlaylistEndpoints playlistEndpoints;

  late final EndpointTrack track;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'album': album,
        'playlistEndpoints': playlistEndpoints,
        'track': track,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
