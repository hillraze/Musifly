/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Artist extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Artist._({
    int? id,
    required this.name,
    required this.bio,
    this.imageUrl,
    this.albums,
    required this.createdAt,
  }) : super(id);

  factory Artist({
    int? id,
    required String name,
    required String bio,
    String? imageUrl,
    List<_i2.Album>? albums,
    required DateTime createdAt,
  }) = _ArtistImpl;

  factory Artist.fromJson(Map<String, dynamic> jsonSerialization) {
    return Artist(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      bio: jsonSerialization['bio'] as String,
      imageUrl: jsonSerialization['imageUrl'] as String?,
      albums: (jsonSerialization['albums'] as List?)
          ?.map((e) => _i2.Album.fromJson((e as Map<String, dynamic>)))
          .toList(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = ArtistTable();

  static const db = ArtistRepository._();

  String name;

  String bio;

  String? imageUrl;

  List<_i2.Album>? albums;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

  Artist copyWith({
    int? id,
    String? name,
    String? bio,
    String? imageUrl,
    List<_i2.Album>? albums,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'bio': bio,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (albums != null)
        'albums': albums?.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'bio': bio,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (albums != null)
        'albums': albums?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'createdAt': createdAt.toJson(),
    };
  }

  static ArtistInclude include({_i2.AlbumIncludeList? albums}) {
    return ArtistInclude._(albums: albums);
  }

  static ArtistIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtistTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtistTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtistTable>? orderByList,
    ArtistInclude? include,
  }) {
    return ArtistIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Artist.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Artist.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtistImpl extends Artist {
  _ArtistImpl({
    int? id,
    required String name,
    required String bio,
    String? imageUrl,
    List<_i2.Album>? albums,
    required DateTime createdAt,
  }) : super._(
          id: id,
          name: name,
          bio: bio,
          imageUrl: imageUrl,
          albums: albums,
          createdAt: createdAt,
        );

  @override
  Artist copyWith({
    Object? id = _Undefined,
    String? name,
    String? bio,
    Object? imageUrl = _Undefined,
    Object? albums = _Undefined,
    DateTime? createdAt,
  }) {
    return Artist(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      albums: albums is List<_i2.Album>? ? albums : this.albums?.clone(),
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ArtistTable extends _i1.Table {
  ArtistTable({super.tableRelation}) : super(tableName: 'artist') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    bio = _i1.ColumnString(
      'bio',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString bio;

  late final _i1.ColumnString imageUrl;

  _i2.AlbumTable? ___albums;

  _i1.ManyRelation<_i2.AlbumTable>? _albums;

  late final _i1.ColumnDateTime createdAt;

  _i2.AlbumTable get __albums {
    if (___albums != null) return ___albums!;
    ___albums = _i1.createRelationTable(
      relationFieldName: '__albums',
      field: Artist.t.id,
      foreignField: _i2.Album.t.artistId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AlbumTable(tableRelation: foreignTableRelation),
    );
    return ___albums!;
  }

  _i1.ManyRelation<_i2.AlbumTable> get albums {
    if (_albums != null) return _albums!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'albums',
      field: Artist.t.id,
      foreignField: _i2.Album.t.artistId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AlbumTable(tableRelation: foreignTableRelation),
    );
    _albums = _i1.ManyRelation<_i2.AlbumTable>(
      tableWithRelations: relationTable,
      table: _i2.AlbumTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _albums!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        bio,
        imageUrl,
        createdAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'albums') {
      return __albums;
    }
    return null;
  }
}

class ArtistInclude extends _i1.IncludeObject {
  ArtistInclude._({_i2.AlbumIncludeList? albums}) {
    _albums = albums;
  }

  _i2.AlbumIncludeList? _albums;

  @override
  Map<String, _i1.Include?> get includes => {'albums': _albums};

  @override
  _i1.Table get table => Artist.t;
}

class ArtistIncludeList extends _i1.IncludeList {
  ArtistIncludeList._({
    _i1.WhereExpressionBuilder<ArtistTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Artist.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Artist.t;
}

class ArtistRepository {
  const ArtistRepository._();

  final attach = const ArtistAttachRepository._();

  final attachRow = const ArtistAttachRowRepository._();

  Future<List<Artist>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtistTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtistTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtistTable>? orderByList,
    _i1.Transaction? transaction,
    ArtistInclude? include,
  }) async {
    return session.db.find<Artist>(
      where: where?.call(Artist.t),
      orderBy: orderBy?.call(Artist.t),
      orderByList: orderByList?.call(Artist.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Artist?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtistTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtistTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtistTable>? orderByList,
    _i1.Transaction? transaction,
    ArtistInclude? include,
  }) async {
    return session.db.findFirstRow<Artist>(
      where: where?.call(Artist.t),
      orderBy: orderBy?.call(Artist.t),
      orderByList: orderByList?.call(Artist.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Artist?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtistInclude? include,
  }) async {
    return session.db.findById<Artist>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Artist>> insert(
    _i1.Session session,
    List<Artist> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Artist>(
      rows,
      transaction: transaction,
    );
  }

  Future<Artist> insertRow(
    _i1.Session session,
    Artist row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Artist>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Artist>> update(
    _i1.Session session,
    List<Artist> rows, {
    _i1.ColumnSelections<ArtistTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Artist>(
      rows,
      columns: columns?.call(Artist.t),
      transaction: transaction,
    );
  }

  Future<Artist> updateRow(
    _i1.Session session,
    Artist row, {
    _i1.ColumnSelections<ArtistTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Artist>(
      row,
      columns: columns?.call(Artist.t),
      transaction: transaction,
    );
  }

  Future<List<Artist>> delete(
    _i1.Session session,
    List<Artist> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Artist>(
      rows,
      transaction: transaction,
    );
  }

  Future<Artist> deleteRow(
    _i1.Session session,
    Artist row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Artist>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Artist>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtistTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Artist>(
      where: where(Artist.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtistTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Artist>(
      where: where?.call(Artist.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtistAttachRepository {
  const ArtistAttachRepository._();

  Future<void> albums(
    _i1.Session session,
    Artist artist,
    List<_i2.Album> album,
  ) async {
    if (album.any((e) => e.id == null)) {
      throw ArgumentError.notNull('album.id');
    }
    if (artist.id == null) {
      throw ArgumentError.notNull('artist.id');
    }

    var $album = album.map((e) => e.copyWith(artistId: artist.id)).toList();
    await session.db.update<_i2.Album>(
      $album,
      columns: [_i2.Album.t.artistId],
    );
  }
}

class ArtistAttachRowRepository {
  const ArtistAttachRowRepository._();

  Future<void> albums(
    _i1.Session session,
    Artist artist,
    _i2.Album album,
  ) async {
    if (album.id == null) {
      throw ArgumentError.notNull('album.id');
    }
    if (artist.id == null) {
      throw ArgumentError.notNull('artist.id');
    }

    var $album = album.copyWith(artistId: artist.id);
    await session.db.updateRow<_i2.Album>(
      $album,
      columns: [_i2.Album.t.artistId],
    );
  }
}
