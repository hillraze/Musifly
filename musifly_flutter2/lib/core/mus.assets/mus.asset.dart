class MusAsset {
  const MusAsset.bitmap(this.path) : type = MusAssetType.bitmap;

  const MusAsset.vector(this.path) : type = MusAssetType.vector;

  final String path;
  final MusAssetType type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusAsset &&
          runtimeType == other.runtimeType &&
          path == other.path &&
          type == other.type;

  @override
  int get hashCode => path.hashCode ^ type.hashCode;

  @override
  String toString() {
    return 'MusAsset{path: $path, type: $type}';
  }
}

enum MusAssetType {
  bitmap,
  vector,
}
