import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musifly_client/musifly_client.dart';

part 'track.model.freezed.dart';
part 'track.model.g.dart';

@freezed
class TrackModel with _$TrackModel {
  const factory TrackModel({
    required String cover,
    required String title,
    required String artist,
    required Album? album,
    required String genre,
    required String audioLink,
  }) = _TrackModel;

  factory TrackModel.mock() {
    return const TrackModel(
      cover: "",
      artist: "Billie Eilish",
      album: null,
      title: "Bad Guy",
      genre: 'k-pop',
      audioLink: '',
    );
  }

  factory TrackModel.fromResponse(Track response) => TrackModel(
        title: response.title,
        artist: '',
        album: response.album,
        genre: '',
        cover: '',
        audioLink: response.audioUrl,
      );

  factory TrackModel.fromJson(Map<String, dynamic> json) =>
      _$TrackModelFromJson(json);
}
