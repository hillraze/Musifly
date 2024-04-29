// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrackModel _$TrackModelFromJson(Map<String, dynamic> json) {
  return _TrackModel.fromJson(json);
}

/// @nodoc
mixin _$TrackModel {
  String get cover => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get artist => throw _privateConstructorUsedError;
  String get genre => throw _privateConstructorUsedError;
  String get audioLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackModelCopyWith<TrackModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackModelCopyWith<$Res> {
  factory $TrackModelCopyWith(
          TrackModel value, $Res Function(TrackModel) then) =
      _$TrackModelCopyWithImpl<$Res, TrackModel>;
  @useResult
  $Res call(
      {String cover,
      String title,
      String artist,
      String genre,
      String audioLink});
}

/// @nodoc
class _$TrackModelCopyWithImpl<$Res, $Val extends TrackModel>
    implements $TrackModelCopyWith<$Res> {
  _$TrackModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cover = null,
    Object? title = null,
    Object? artist = null,
    Object? genre = null,
    Object? audioLink = null,
  }) {
    return _then(_value.copyWith(
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      audioLink: null == audioLink
          ? _value.audioLink
          : audioLink // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackModelImplCopyWith<$Res>
    implements $TrackModelCopyWith<$Res> {
  factory _$$TrackModelImplCopyWith(
          _$TrackModelImpl value, $Res Function(_$TrackModelImpl) then) =
      __$$TrackModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cover,
      String title,
      String artist,
      String genre,
      String audioLink});
}

/// @nodoc
class __$$TrackModelImplCopyWithImpl<$Res>
    extends _$TrackModelCopyWithImpl<$Res, _$TrackModelImpl>
    implements _$$TrackModelImplCopyWith<$Res> {
  __$$TrackModelImplCopyWithImpl(
      _$TrackModelImpl _value, $Res Function(_$TrackModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cover = null,
    Object? title = null,
    Object? artist = null,
    Object? genre = null,
    Object? audioLink = null,
  }) {
    return _then(_$TrackModelImpl(
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      audioLink: null == audioLink
          ? _value.audioLink
          : audioLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackModelImpl implements _TrackModel {
  const _$TrackModelImpl(
      {required this.cover,
      required this.title,
      required this.artist,
      required this.genre,
      required this.audioLink});

  factory _$TrackModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackModelImplFromJson(json);

  @override
  final String cover;
  @override
  final String title;
  @override
  final String artist;
  @override
  final String genre;
  @override
  final String audioLink;

  @override
  String toString() {
    return 'TrackModel(cover: $cover, title: $title, artist: $artist, genre: $genre, audioLink: $audioLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackModelImpl &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.audioLink, audioLink) ||
                other.audioLink == audioLink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cover, title, artist, genre, audioLink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackModelImplCopyWith<_$TrackModelImpl> get copyWith =>
      __$$TrackModelImplCopyWithImpl<_$TrackModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackModelImplToJson(
      this,
    );
  }
}

abstract class _TrackModel implements TrackModel {
  const factory _TrackModel(
      {required final String cover,
      required final String title,
      required final String artist,
      required final String genre,
      required final String audioLink}) = _$TrackModelImpl;

  factory _TrackModel.fromJson(Map<String, dynamic> json) =
      _$TrackModelImpl.fromJson;

  @override
  String get cover;
  @override
  String get title;
  @override
  String get artist;
  @override
  String get genre;
  @override
  String get audioLink;
  @override
  @JsonKey(ignore: true)
  _$$TrackModelImplCopyWith<_$TrackModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
