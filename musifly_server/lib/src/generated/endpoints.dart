/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/album_endpoint.dart' as _i2;
import '../endpoints/song_endpoint.dart' as _i3;

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
      'song': _i3.SongEndpoint()
        ..initialize(
          server,
          'song',
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
    connectors['song'] = _i1.EndpointConnector(
      name: 'song',
      endpoint: endpoints['song']!,
      methodConnectors: {
        'getNewSongs': _i1.MethodConnector(
          name: 'getNewSongs',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['song'] as _i3.SongEndpoint).getNewSongs(session),
        )
      },
    );
  }
}
