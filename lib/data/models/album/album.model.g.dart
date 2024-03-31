// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumModelImpl _$$AlbumModelImplFromJson(Map<String, dynamic> json) =>
    _$AlbumModelImpl(
      coverUrl: json['coverUrl'] as String,
      artistName: json['artistName'] as String,
      albumName: json['albumName'] as String,
      genre: json['genre'] as String,
      albumUrl: json['albumUrl'] as String,
    );

Map<String, dynamic> _$$AlbumModelImplToJson(_$AlbumModelImpl instance) =>
    <String, dynamic>{
      'coverUrl': instance.coverUrl,
      'artistName': instance.artistName,
      'albumName': instance.albumName,
      'genre': instance.genre,
      'albumUrl': instance.albumUrl,
    };
