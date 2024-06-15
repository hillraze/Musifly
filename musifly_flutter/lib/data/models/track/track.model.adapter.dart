import 'package:hive/hive.dart';

import 'track.model.dart';

class TrackModelAdapter extends TypeAdapter<TrackModel> {
  @override
  final int typeId = 0;

  @override
  TrackModel read(BinaryReader reader) {
    return TrackModel(
      cover: reader.readString(),
      title: reader.readString(),
      artist: reader.readString(),
      album: null,
      genre: reader.readString(),
      audioLink: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, TrackModel obj) {
    writer.writeString(obj.cover);
    writer.writeString(obj.title);
    writer.writeString(obj.artist);
    writer.writeString(obj.genre);
    writer.writeString(obj.audioLink);
  }
}
