/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/admin_endpoints.dart' as _i2;
import '../endpoints/album_endpoints.dart' as _i3;
import '../endpoints/artist_endpoint.dart' as _i4;
import '../endpoints/playlist_endpoint.dart' as _i5;
import '../endpoints/playlist_track_endpoint.dart' as _i6;
import '../endpoints/track_endpoints.dart' as _i7;
import 'package:musifly_server/src/generated/album.dart' as _i8;
import 'package:musifly_server/src/generated/artist.dart' as _i9;
import 'package:musifly_server/src/generated/playlist.dart' as _i10;
import 'package:musifly_server/src/generated/playlist_track.dart' as _i11;
import 'package:musifly_server/src/generated/track.dart' as _i12;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'admin': _i2.AdminEndpoint()
        ..initialize(
          server,
          'admin',
          null,
        ),
      'album': _i3.AlbumEndpoint()
        ..initialize(
          server,
          'album',
          null,
        ),
      'artist': _i4.ArtistEndpoint()
        ..initialize(
          server,
          'artist',
          null,
        ),
      'playlist': _i5.PlaylistEndpoint()
        ..initialize(
          server,
          'playlist',
          null,
        ),
      'playlistTrack': _i6.PlaylistTrackEndpoint()
        ..initialize(
          server,
          'playlistTrack',
          null,
        ),
      'track': _i7.TrackEndpoint()
        ..initialize(
          server,
          'track',
          null,
        ),
    };
    connectors['admin'] = _i1.EndpointConnector(
      name: 'admin',
      endpoint: endpoints['admin']!,
      methodConnectors: {},
    );
    connectors['album'] = _i1.EndpointConnector(
      name: 'album',
      endpoint: endpoints['album']!,
      methodConnectors: {
        'createAlbum': _i1.MethodConnector(
          name: 'createAlbum',
          params: {
            'album': _i1.ParameterDescription(
              name: 'album',
              type: _i1.getType<_i8.Album>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['album'] as _i3.AlbumEndpoint).createAlbum(
            session,
            params['album'],
          ),
        ),
        'updateAlbum': _i1.MethodConnector(
          name: 'updateAlbum',
          params: {
            'album': _i1.ParameterDescription(
              name: 'album',
              type: _i1.getType<_i8.Album>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['album'] as _i3.AlbumEndpoint).updateAlbum(
            session,
            params['album'],
          ),
        ),
        'getAlbums': _i1.MethodConnector(
          name: 'getAlbums',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['album'] as _i3.AlbumEndpoint).getAlbums(session),
        ),
        'getAlbum': _i1.MethodConnector(
          name: 'getAlbum',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['album'] as _i3.AlbumEndpoint).getAlbum(
            session,
            params['id'],
          ),
        ),
        'deleteAlbum': _i1.MethodConnector(
          name: 'deleteAlbum',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['album'] as _i3.AlbumEndpoint).deleteAlbum(
            session,
            params['id'],
          ),
        ),
        'getTopAlbums': _i1.MethodConnector(
          name: 'getTopAlbums',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['album'] as _i3.AlbumEndpoint).getTopAlbums(session),
        ),
        'getNewAlbums': _i1.MethodConnector(
          name: 'getNewAlbums',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['album'] as _i3.AlbumEndpoint).getNewAlbums(session),
        ),
      },
    );
    connectors['artist'] = _i1.EndpointConnector(
      name: 'artist',
      endpoint: endpoints['artist']!,
      methodConnectors: {
        'addArtist': _i1.MethodConnector(
          name: 'addArtist',
          params: {
            'artist': _i1.ParameterDescription(
              name: 'artist',
              type: _i1.getType<_i9.Artist>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artist'] as _i4.ArtistEndpoint).addArtist(
            session,
            params['artist'],
          ),
        ),
        'getArtists': _i1.MethodConnector(
          name: 'getArtists',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artist'] as _i4.ArtistEndpoint).getArtists(session),
        ),
        'updateArtist': _i1.MethodConnector(
          name: 'updateArtist',
          params: {
            'artist': _i1.ParameterDescription(
              name: 'artist',
              type: _i1.getType<_i9.Artist>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artist'] as _i4.ArtistEndpoint).updateArtist(
            session,
            params['artist'],
          ),
        ),
        'deleteArtist': _i1.MethodConnector(
          name: 'deleteArtist',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artist'] as _i4.ArtistEndpoint).deleteArtist(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['playlist'] = _i1.EndpointConnector(
      name: 'playlist',
      endpoint: endpoints['playlist']!,
      methodConnectors: {
        'createPlaylist': _i1.MethodConnector(
          name: 'createPlaylist',
          params: {
            'playlist': _i1.ParameterDescription(
              name: 'playlist',
              type: _i1.getType<_i10.Playlist>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['playlist'] as _i5.PlaylistEndpoint).createPlaylist(
            session,
            params['playlist'],
          ),
        ),
        'getPlaylist': _i1.MethodConnector(
          name: 'getPlaylist',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['playlist'] as _i5.PlaylistEndpoint).getPlaylist(
            session,
            params['id'],
          ),
        ),
        'getPlaylists': _i1.MethodConnector(
          name: 'getPlaylists',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['playlist'] as _i5.PlaylistEndpoint)
                  .getPlaylists(session),
        ),
        'updatePlaylist': _i1.MethodConnector(
          name: 'updatePlaylist',
          params: {
            'playlist': _i1.ParameterDescription(
              name: 'playlist',
              type: _i1.getType<_i10.Playlist>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['playlist'] as _i5.PlaylistEndpoint).updatePlaylist(
            session,
            params['playlist'],
          ),
        ),
        'deletePlaylist': _i1.MethodConnector(
          name: 'deletePlaylist',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['playlist'] as _i5.PlaylistEndpoint).deletePlaylist(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['playlistTrack'] = _i1.EndpointConnector(
      name: 'playlistTrack',
      endpoint: endpoints['playlistTrack']!,
      methodConnectors: {
        'createPlaylistTrack': _i1.MethodConnector(
          name: 'createPlaylistTrack',
          params: {
            'playlist': _i1.ParameterDescription(
              name: 'playlist',
              type: _i1.getType<_i11.PlaylistTrack>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['playlistTrack'] as _i6.PlaylistTrackEndpoint)
                  .createPlaylistTrack(
            session,
            params['playlist'],
          ),
        ),
        'getPlaylistTrack': _i1.MethodConnector(
          name: 'getPlaylistTrack',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['playlistTrack'] as _i6.PlaylistTrackEndpoint)
                  .getPlaylistTrack(
            session,
            params['id'],
          ),
        ),
        'getPlaylistTracks': _i1.MethodConnector(
          name: 'getPlaylistTracks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['playlistTrack'] as _i6.PlaylistTrackEndpoint)
                  .getPlaylistTracks(session),
        ),
        'updatePlaylistTrack': _i1.MethodConnector(
          name: 'updatePlaylistTrack',
          params: {
            'playlist': _i1.ParameterDescription(
              name: 'playlist',
              type: _i1.getType<_i11.PlaylistTrack>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['playlistTrack'] as _i6.PlaylistTrackEndpoint)
                  .updatePlaylistTrack(
            session,
            params['playlist'],
          ),
        ),
        'deletePlaylistTrack': _i1.MethodConnector(
          name: 'deletePlaylistTrack',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['playlistTrack'] as _i6.PlaylistTrackEndpoint)
                  .deletePlaylistTrack(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['track'] = _i1.EndpointConnector(
      name: 'track',
      endpoint: endpoints['track']!,
      methodConnectors: {
        'createTrack': _i1.MethodConnector(
          name: 'createTrack',
          params: {
            'track': _i1.ParameterDescription(
              name: 'track',
              type: _i1.getType<_i12.Track>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['track'] as _i7.TrackEndpoint).createTrack(
            session,
            params['track'],
          ),
        ),
        'updateTrack': _i1.MethodConnector(
          name: 'updateTrack',
          params: {
            'track': _i1.ParameterDescription(
              name: 'track',
              type: _i1.getType<_i12.Track>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['track'] as _i7.TrackEndpoint).updateTrack(
            session,
            params['track'],
          ),
        ),
        'deleteTrack': _i1.MethodConnector(
          name: 'deleteTrack',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['track'] as _i7.TrackEndpoint).deleteTrack(
            session,
            params['id'],
          ),
        ),
        'getTracks': _i1.MethodConnector(
          name: 'getTracks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['track'] as _i7.TrackEndpoint).getTracks(session),
        ),
      },
    );
  }
}
