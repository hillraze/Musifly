import 'package:dio/dio.dart';
import 'package:musifly/data/models/album/album.model.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "http://192.168.0.173:8080/") // TODO: Replace with your IP
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("albums/new")
  Future<List<AlbumModel>> getNewAlbums();
}
