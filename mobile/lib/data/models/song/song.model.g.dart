// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongModelImpl _$$SongModelImplFromJson(Map<String, dynamic> json) =>
    _$SongModelImpl(
      cover: json['cover'] as String,
      artist: json['artist'] as String,
      title: json['title'] as String,
      genre: json['genre'] as String,
      audioLink: json['audioLink'] as String,
    );

Map<String, dynamic> _$$SongModelImplToJson(_$SongModelImpl instance) =>
    <String, dynamic>{
      'cover': instance.cover,
      'artist': instance.artist,
      'title': instance.title,
      'genre': instance.genre,
      'audioLink': instance.audioLink,
    };
