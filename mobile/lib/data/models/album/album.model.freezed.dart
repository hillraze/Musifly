// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlbumModel _$AlbumModelFromJson(Map<String, dynamic> json) {
  return _AlbumModel.fromJson(json);
}

/// @nodoc
mixin _$AlbumModel {
  String? get cover => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get genre => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumModelCopyWith<AlbumModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumModelCopyWith<$Res> {
  factory $AlbumModelCopyWith(
          AlbumModel value, $Res Function(AlbumModel) then) =
      _$AlbumModelCopyWithImpl<$Res, AlbumModel>;
  @useResult
  $Res call({String? cover, String title, String genre});
}

/// @nodoc
class _$AlbumModelCopyWithImpl<$Res, $Val extends AlbumModel>
    implements $AlbumModelCopyWith<$Res> {
  _$AlbumModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cover = freezed,
    Object? title = null,
    Object? genre = null,
  }) {
    return _then(_value.copyWith(
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumModelImplCopyWith<$Res>
    implements $AlbumModelCopyWith<$Res> {
  factory _$$AlbumModelImplCopyWith(
          _$AlbumModelImpl value, $Res Function(_$AlbumModelImpl) then) =
      __$$AlbumModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? cover, String title, String genre});
}

/// @nodoc
class __$$AlbumModelImplCopyWithImpl<$Res>
    extends _$AlbumModelCopyWithImpl<$Res, _$AlbumModelImpl>
    implements _$$AlbumModelImplCopyWith<$Res> {
  __$$AlbumModelImplCopyWithImpl(
      _$AlbumModelImpl _value, $Res Function(_$AlbumModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cover = freezed,
    Object? title = null,
    Object? genre = null,
  }) {
    return _then(_$AlbumModelImpl(
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumModelImpl implements _AlbumModel {
  const _$AlbumModelImpl(
      {this.cover, required this.title, required this.genre});

  factory _$AlbumModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumModelImplFromJson(json);

  @override
  final String? cover;
  @override
  final String title;
  @override
  final String genre;

  @override
  String toString() {
    return 'AlbumModel(cover: $cover, title: $title, genre: $genre)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumModelImpl &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.genre, genre) || other.genre == genre));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cover, title, genre);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumModelImplCopyWith<_$AlbumModelImpl> get copyWith =>
      __$$AlbumModelImplCopyWithImpl<_$AlbumModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumModelImplToJson(
      this,
    );
  }
}

abstract class _AlbumModel implements AlbumModel {
  const factory _AlbumModel(
      {final String? cover,
      required final String title,
      required final String genre}) = _$AlbumModelImpl;

  factory _AlbumModel.fromJson(Map<String, dynamic> json) =
      _$AlbumModelImpl.fromJson;

  @override
  String? get cover;
  @override
  String get title;
  @override
  String get genre;
  @override
  @JsonKey(ignore: true)
  _$$AlbumModelImplCopyWith<_$AlbumModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
