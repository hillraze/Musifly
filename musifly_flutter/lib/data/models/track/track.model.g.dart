// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackModelImpl _$$TrackModelImplFromJson(Map<String, dynamic> json) =>
    _$TrackModelImpl(
      cover: json['cover'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      genre: json['genre'] as String,
      audioLink: json['audioLink'] as String,
    );

Map<String, dynamic> _$$TrackModelImplToJson(_$TrackModelImpl instance) =>
    <String, dynamic>{
      'cover': instance.cover,
      'title': instance.title,
      'artist': instance.artist,
      'genre': instance.genre,
      'audioLink': instance.audioLink,
    };
