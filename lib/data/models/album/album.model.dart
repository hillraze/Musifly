import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.model.freezed.dart';
part 'album.model.g.dart';

@freezed
class AlbumModel with _$AlbumModel {
  factory AlbumModel.mock() {
    return const AlbumModel(
      coverUrl: "",
      artistName: "Billie Eilish",
      albumName: "don't smile at me",
      genre: 'k-pop',
      albumUrl: '',
    );
  }

  const factory AlbumModel({
    required String coverUrl,
    required String artistName,
    required String albumName,
    required String genre,
    required String albumUrl,
  }) = _AlbumModel;

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);
}
