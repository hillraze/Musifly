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
import 'package:musifly_client/src/protocol/artist.dart' as _i4;
import 'package:musifly_client/src/protocol/playlist.dart' as _i5;
import 'package:musifly_client/src/protocol/playlist_track.dart' as _i6;
import 'package:musifly_client/src/protocol/track.dart' as _i7;
import 'protocol.dart' as _i8;

/// {@category Endpoint}
class EndpointAdmin extends _i1.EndpointRef {
  EndpointAdmin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'admin';
}

/// {@category Endpoint}
class EndpointAlbum extends _i1.EndpointRef {
  EndpointAlbum(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'album';

  _i2.Future<_i3.Album> createAlbum(_i3.Album album) =>
      caller.callServerEndpoint<_i3.Album>(
        'album',
        'createAlbum',
        {'album': album},
      );

  _i2.Future<_i3.Album> updateAlbum(_i3.Album album) =>
      caller.callServerEndpoint<_i3.Album>(
        'album',
        'updateAlbum',
        {'album': album},
      );

  _i2.Future<List<_i3.Album>> getAlbums() =>
      caller.callServerEndpoint<List<_i3.Album>>(
        'album',
        'getAlbums',
        {},
      );

  _i2.Future<_i3.Album?> getAlbum(int id) =>
      caller.callServerEndpoint<_i3.Album?>(
        'album',
        'getAlbum',
        {'id': id},
      );

  _i2.Future<_i3.Album> deleteAlbum(int id) =>
      caller.callServerEndpoint<_i3.Album>(
        'album',
        'deleteAlbum',
        {'id': id},
      );

  _i2.Future<List<_i3.Album>> getTopAlbums() =>
      caller.callServerEndpoint<List<_i3.Album>>(
        'album',
        'getTopAlbums',
        {},
      );

  _i2.Future<List<_i3.Album>> getNewAlbums() =>
      caller.callServerEndpoint<List<_i3.Album>>(
        'album',
        'getNewAlbums',
        {},
      );
}

/// {@category Endpoint}
class EndpointArtist extends _i1.EndpointRef {
  EndpointArtist(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'artist';

  _i2.Future<_i4.Artist> addArtist(_i4.Artist artist) =>
      caller.callServerEndpoint<_i4.Artist>(
        'artist',
        'addArtist',
        {'artist': artist},
      );

  _i2.Future<List<_i4.Artist>> getArtists() =>
      caller.callServerEndpoint<List<_i4.Artist>>(
        'artist',
        'getArtists',
        {},
      );

  _i2.Future<_i4.Artist> updateArtist(_i4.Artist artist) =>
      caller.callServerEndpoint<_i4.Artist>(
        'artist',
        'updateArtist',
        {'artist': artist},
      );

  _i2.Future<_i4.Artist> deleteArtist(int id) =>
      caller.callServerEndpoint<_i4.Artist>(
        'artist',
        'deleteArtist',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointPlaylist extends _i1.EndpointRef {
  EndpointPlaylist(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'playlist';

  _i2.Future<_i5.Playlist> createPlaylist(_i5.Playlist playlist) =>
      caller.callServerEndpoint<_i5.Playlist>(
        'playlist',
        'createPlaylist',
        {'playlist': playlist},
      );

  _i2.Future<_i5.Playlist?> getPlaylist(int id) =>
      caller.callServerEndpoint<_i5.Playlist?>(
        'playlist',
        'getPlaylist',
        {'id': id},
      );

  _i2.Future<List<_i5.Playlist>> getPlaylists() =>
      caller.callServerEndpoint<List<_i5.Playlist>>(
        'playlist',
        'getPlaylists',
        {},
      );

  _i2.Future<_i5.Playlist> updatePlaylist(_i5.Playlist playlist) =>
      caller.callServerEndpoint<_i5.Playlist>(
        'playlist',
        'updatePlaylist',
        {'playlist': playlist},
      );

  _i2.Future<_i5.Playlist> deletePlaylist(int id) =>
      caller.callServerEndpoint<_i5.Playlist>(
        'playlist',
        'deletePlaylist',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointPlaylistTrack extends _i1.EndpointRef {
  EndpointPlaylistTrack(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'playlistTrack';

  _i2.Future<_i6.PlaylistTrack> createPlaylistTrack(
          _i6.PlaylistTrack playlist) =>
      caller.callServerEndpoint<_i6.PlaylistTrack>(
        'playlistTrack',
        'createPlaylistTrack',
        {'playlist': playlist},
      );

  _i2.Future<_i6.PlaylistTrack?> getPlaylistTrack(int id) =>
      caller.callServerEndpoint<_i6.PlaylistTrack?>(
        'playlistTrack',
        'getPlaylistTrack',
        {'id': id},
      );

  _i2.Future<List<_i6.PlaylistTrack>> getPlaylistTracks() =>
      caller.callServerEndpoint<List<_i6.PlaylistTrack>>(
        'playlistTrack',
        'getPlaylistTracks',
        {},
      );

  _i2.Future<_i6.PlaylistTrack> updatePlaylistTrack(
          _i6.PlaylistTrack playlist) =>
      caller.callServerEndpoint<_i6.PlaylistTrack>(
        'playlistTrack',
        'updatePlaylistTrack',
        {'playlist': playlist},
      );

  _i2.Future<_i6.PlaylistTrack> deletePlaylistTrack(int id) =>
      caller.callServerEndpoint<_i6.PlaylistTrack>(
        'playlistTrack',
        'deletePlaylistTrack',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointTrack extends _i1.EndpointRef {
  EndpointTrack(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'track';

  _i2.Future<_i7.Track> createTrack(_i7.Track track) =>
      caller.callServerEndpoint<_i7.Track>(
        'track',
        'createTrack',
        {'track': track},
      );

  _i2.Future<_i7.Track> updateTrack(_i7.Track track) =>
      caller.callServerEndpoint<_i7.Track>(
        'track',
        'updateTrack',
        {'track': track},
      );

  _i2.Future<_i7.Track> deleteTrack(int id) =>
      caller.callServerEndpoint<_i7.Track>(
        'track',
        'deleteTrack',
        {'id': id},
      );

  _i2.Future<List<_i7.Track>> getTracks() =>
      caller.callServerEndpoint<List<_i7.Track>>(
        'track',
        'getTracks',
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
          _i8.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    admin = EndpointAdmin(this);
    album = EndpointAlbum(this);
    artist = EndpointArtist(this);
    playlist = EndpointPlaylist(this);
    playlistTrack = EndpointPlaylistTrack(this);
    track = EndpointTrack(this);
  }

  late final EndpointAdmin admin;

  late final EndpointAlbum album;

  late final EndpointArtist artist;

  late final EndpointPlaylist playlist;

  late final EndpointPlaylistTrack playlistTrack;

  late final EndpointTrack track;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'admin': admin,
        'album': album,
        'artist': artist,
        'playlist': playlist,
        'playlistTrack': playlistTrack,
        'track': track,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
