import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:musifly_client/musifly_client.dart';

class PlayerNotifier extends ChangeNotifier {
  final AudioHandler _audioHandler;
  Timer? _positionTimer;
  Duration _currentPosition = Duration.zero;

  PlayerNotifier(this._audioHandler) {
    _positionTimer = Timer.periodic(Duration(seconds: 1), (_) {
      _updatePosition();
    });
  }

  AudioHandler get audioHandler => _audioHandler;

  MediaItem? get currentTrack => _audioHandler.mediaItem.value;

  Duration get currentPosition => _currentPosition;

  void _updatePosition() {
    _audioHandler.playbackState.first.then((playbackState) {
      _currentPosition = playbackState.position;
      notifyListeners();
    });
  }

  void setTrackList(
      List<PlaylistTrack> playlistTracks, PlaylistTrack? thisTrack) {
    final mediaItems = playlistTracks
        .map((pt) => MediaItem(
              id: pt.track!.id.toString(),
              album: pt.track!.album?.title ?? '',
              title: pt.track!.title,
              artist: pt.track!.artist?.name ?? '',
              artUri: Uri.parse(
                  'https://static.mp3xa.me/album_images/400x400/tyla-tyla.jpg'),
              extras: {'url': pt.track!.audioUrl},
            ))
        .toList();
    if (thisTrack != null) {
      _audioHandler.addQueueItems(mediaItems);
      int _index = playlistTracks.indexOf(thisTrack);
      _audioHandler.skipToQueueItem(_index);
    }
    // setTrack(thisTrack);
  }

  void skipToNextTrack() => _audioHandler.skipToNext();
  void skipToPreviousTrack() => _audioHandler.skipToPrevious();

  void setTrack(Track newTrack) {
    final mediaItem = MediaItem(
      id: newTrack.id.toString(),
      album: newTrack.album?.title ?? '',
      title: newTrack.title,
      artist: newTrack.artist?.name ?? '',
      extras: {'url': newTrack.audioUrl},
    );
    _audioHandler.addQueueItem(mediaItem);
  }

  Future<void> playTrack() async => _audioHandler.play();
  void pauseTrack() => _audioHandler.pause();

  Future<void> seek(Duration position) => _audioHandler.seek(position);

  @override
  void dispose() {
    _positionTimer?.cancel();
    super.dispose();
  }

  Stream<MediaItem?> get currentTrackStream => _audioHandler.mediaItem;
  Stream<PlaybackState> get playbackStateStream => _audioHandler.playbackState;
}
