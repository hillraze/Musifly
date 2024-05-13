import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musifly/data/models/song/song.model.dart';
import 'package:musifly_client/musifly_client.dart';

part 'album.model.freezed.dart';
part 'album.model.g.dart';

@freezed
class AlbumModel with _$AlbumModel {
  factory AlbumModel.mock() {
    return const AlbumModel(
      cover: '',
      title: "Billie Eilish",
      artist: "dsddsd",
      genre: 'k-pop',
      songs: [],
    );
  }

  const factory AlbumModel({
    required String cover,
    required String title,
    required String artist,
    required String genre,
    required List<SongModel> songs,
  }) = _AlbumModel;

  // Convert Serverpod Model to our Frontend Model
  factory AlbumModel.fromResponse(Album response) => AlbumModel(
        title: response.title,
        artist: response.artist,
        genre: response.genre,
        cover: response.cover,
        songs: response.tracks.map(SongModel.fromResponse).toList(),
      );

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);
}
