// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongModelImpl _$$SongModelImplFromJson(Map<String, dynamic> json) =>
    _$SongModelImpl(
      coverUrl: json['coverUrl'] as String,
      artistName: json['artistName'] as String,
      songName: json['songName'] as String,
      genre: json['genre'] as String,
      audioUrl: json['audioUrl'] as String,
    );

Map<String, dynamic> _$$SongModelImplToJson(_$SongModelImpl instance) =>
    <String, dynamic>{
      'coverUrl': instance.coverUrl,
      'artistName': instance.artistName,
      'songName': instance.songName,
      'genre': instance.genre,
      'audioUrl': instance.audioUrl,
    };
