import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.model.freezed.dart';
part 'song.model.g.dart';

@freezed
class SongModel with _$SongModel {
  factory SongModel.mock() {
    return const SongModel(
      cover: "",
      artist: "Billie Eilish",
      title: "Bad Guy",
      genre: 'k-pop',
      audioLink: '',
    );
  }

  const factory SongModel({
    required String cover,
    required String title,
    required String artist,
    required String genre,
    required String audioLink,
  }) = _SongModel;

  factory SongModel.fromJson(Map<String, dynamic> json) =>
      _$SongModelFromJson(json);
}