import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musifly/data/models/track/track.model.dart';
import 'package:musifly_client/musifly_client.dart';

part 'album.model.freezed.dart';
part 'album.model.g.dart';

@freezed
class AlbumModel with _$AlbumModel {
  factory AlbumModel.mock() {
    return const AlbumModel(
      cover: '',
      title: "Billie Eilish",
      artist: null,
      genre: 'k-pop',
      tracks: [],
    );
  }

  const factory AlbumModel({
    required String cover,
    required String title,
    required Artist? artist,
    required String? genre,
    required List<TrackModel> tracks,
  }) = _AlbumModel;

  // Convert Serverpod Model to our Frontend Model
  factory AlbumModel.fromResponse(Album response) => AlbumModel(
        title: response.title,
        artist: response.artist,
        genre: response.genre,
        cover: response.coverUrl ?? '',
        // tracks: response.tracks.map(TrackModel.fromResponse).toList(),
        tracks: [],
      );

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);
}
