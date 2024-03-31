import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.model.freezed.dart';
part 'song.model.g.dart';

@freezed
class SongModel with _$SongModel {
  factory SongModel.mock() {
    return const SongModel(
      coverUrl: "",
      artistName: "Billie Eilish",
      songName: "Bad Guy",
      genre: 'k-pop',
      audioUrl: '',
    );
  }

  const factory SongModel({
    required String coverUrl,
    required String artistName,
    required String songName,
    required String genre,
    required String audioUrl,
  }) = _SongModel;

  factory SongModel.fromJson(Map<String, dynamic> json) =>
      _$SongModelFromJson(json);
}
