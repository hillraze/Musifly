import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.model.freezed.dart';
part 'album.model.g.dart';

@freezed
class AlbumModel with _$AlbumModel {
  factory AlbumModel.mock() {
    return const AlbumModel(
      title: "Billie Eilish",
      genre: 'k-pop',
    );
  }

  const factory AlbumModel({
    String? cover,
    required String title,
    required String genre,
  }) = _AlbumModel;

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);
}
