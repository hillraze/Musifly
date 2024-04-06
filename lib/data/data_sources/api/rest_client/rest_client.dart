import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "http://172.20.14.228:8080/") // TODO: Replace with your IP
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("albums/new")
  Future<dynamic> getNewAlbums();
}
