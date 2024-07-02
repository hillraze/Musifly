import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musifly_client/musifly_client.dart';
import 'package:rxdart/rxdart.dart';

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}

class PlayerNotifier extends ChangeNotifier {
  final _player = AudioPlayer();

  AudioPlayer get player => _player;

  Track? _track;
  Track? get track => _track;

  // set track(Track? newTrack) {
  //   _track = newTrack;
  //   notifyListeners();
  // }

  void setTrack(Track newTrack) {
    _track = newTrack;
    prepareSource(newTrack.audioUrl);
    // notifyListeners();
  }

  Future<void> playTrack() async {
    unawaited(player.play());
  }

  void pauseTrack() {
    player.pause();
  }

  Future<void> prepareSource(String newTrackUrl) async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      // AAC example: https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.aac
      await _player.setAudioSource(AudioSource.uri(Uri.parse(newTrackUrl)));
      print(_player.audioSource.toString());

      final oldTrackUrl = _player.audioSource.toString();

      // case: we already prepared this track
      if (newTrackUrl == oldTrackUrl) return;

      // use resetPlayer when trackUrl is declared now or just updated
      //

      print('before setSource: ${_player.audioSource} ');
      // await _player
      //     .setSource(DeviceFileSource(newTrackUrl, mimeType: 'audio/mpeg'));

      print('after setSource: ${_player.audioSource} ');
      // await _player.resume();
      print('end of preparesource');
      notifyListeners();
    } on PlayerException catch (e) {
      print("Error loading audio source: $e");
    }
    notifyListeners();
  }

  @override
  void dispose() {
    ambiguate(WidgetsBinding.instance)!
        .removeObserver(this as WidgetsBindingObserver);
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _player.dispose();
    super.dispose();
    notifyListeners();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
    notifyListeners();
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));
}

T? ambiguate<T>(T? value) => value;
