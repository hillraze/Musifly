/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/album_endpoints.dart' as _i2;
import '../endpoints/playlist_endpoints.dart' as _i3;
import '../endpoints/track_endpoints.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'album': _i2.AlbumEndpoint()
        ..initialize(
          server,
          'album',
          null,
        ),
      'playlistEndpoints': _i3.PlaylistEndpoints()
        ..initialize(
          server,
          'playlistEndpoints',
          null,
        ),
      'track': _i4.TrackEndpoint()
        ..initialize(
          server,
          'track',
          null,
        ),
    };
    connectors['album'] = _i1.EndpointConnector(
      name: 'album',
      endpoint: endpoints['album']!,
      methodConnectors: {
        'getNewAlbums': _i1.MethodConnector(
          name: 'getNewAlbums',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['album'] as _i2.AlbumEndpoint).getNewAlbums(session),
        )
      },
    );
    connectors['playlistEndpoints'] = _i1.EndpointConnector(
      name: 'playlistEndpoints',
      endpoint: endpoints['playlistEndpoints']!,
      methodConnectors: {
        'PlaylistCreate': _i1.MethodConnector(
          name: 'PlaylistCreate',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'isPublic': _i1.ParameterDescription(
              name: 'isPublic',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['playlistEndpoints'] as _i3.PlaylistEndpoints)
                  .PlaylistCreate(
            session,
            name: params['name'],
            userId: params['userId'],
            isPublic: params['isPublic'],
          ),
        ),
        'addTrack': _i1.MethodConnector(
          name: 'addTrack',
          params: {
            'playlistId': _i1.ParameterDescription(
              name: 'playlistId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'trackId': _i1.ParameterDescription(
              name: 'trackId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['playlistEndpoints'] as _i3.PlaylistEndpoints)
                  .addTrack(
            session,
            playlistId: params['playlistId'],
            trackId: params['trackId'],
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
              (endpoints['playlistEndpoints'] as _i3.PlaylistEndpoints)
                  .getPlaylist(
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
        'getTrack': _i1.MethodConnector(
          name: 'getTrack',
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
              (endpoints['track'] as _i4.TrackEndpoint).getTrack(
            session,
            params['id'],
          ),
        ),
        'getNewTracks': _i1.MethodConnector(
          name: 'getNewTracks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['track'] as _i4.TrackEndpoint).getNewTracks(session),
        ),
      },
    );
  }
}
