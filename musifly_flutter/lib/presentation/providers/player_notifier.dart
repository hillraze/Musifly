import 'dart:async';
import 'dart:io';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musifly/analytics/mus.logger.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:musifly/data/models/track/track.model.dart';
import 'package:musifly/utils/locator_service.dart';
import 'package:path_provider/path_provider.dart';
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

  TrackModel? _track;
  TrackModel? get track => _track;

  // set track(TrackModel? newTrack) {
  //   _track = newTrack;
  //   notifyListeners();
  // }

  void setTrack(TrackModel newTrack) {
    _track = newTrack;
    prepareSource(newTrack.audioLink);
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
// class PlayerNotifier extends ChangeNotifier {
//   PlayerNotifier() {
//     _player = AudioPlayer();
//     // Assuming you want to start with stopped state
//   }
//   late AudioPlayer _player;
//   // PlayerState? _playerStatus = PlayerState.stopped;
//   AudioPlayer get player => _player;
//   Duration? _duration;
//   Duration? _position;
//   StreamSubscription? _durationSubscription;
//   StreamSubscription? _positionSubscription;
//   StreamSubscription? _playerCompleteSubscription;
//   StreamSubscription? _playerStateChangeSubscription;

//   TrackModel? _track;
//   TrackModel? get track => _track;

//   // set track(TrackModel? newTrack) {
//   //   _track = newTrack;
//   //   notifyListeners();
//   // }



//   String get durationText => _duration?.toString().split('.').first ?? '';

//   String get positionText => _position?.toString().split('.').first ?? '';

//   Duration? get duration => _duration;
//   Duration? get position => _position;

//   static final _logger = MusLogger("PlayerNotifier");
//   PlayerState get playerStatus => _player.state;

//   void resetPlayer() {
//     // case 1: first visit on track
//     if (_duration == null ||
//         _position == null ||
//         _player.state != PlayerState.stopped) {
//       _duration = Duration.zero;
//       _position = Duration.zero;
//       _player.stop();
//     }
//   }

//   Future<File> downloadTrack(String url, String filename) async {
//     // Get the directory where files can be saved
//     Directory directory = await getApplicationDocumentsDirectory();
//     String filePath = '${directory.path}/$filename';

//     // Fetch data from the given URL
//     var response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       // Write the file data to the desired file
//       File file = File(filePath);
//       return await file.writeAsBytes(response.bodyBytes);
//     } else {
//       throw Exception('Failed to download file');
//     }
//   }

//   Future<void> prepareSource(String newTrackUrl) async {
//     try {
//       print(_player.source.toString());

//       final oldTrackUrl = _player.source.toString();

//       // case: we already prepared this track
//       if (newTrackUrl == oldTrackUrl) return;

//       // use resetPlayer when trackUrl is declared now or just updated
//       //
//       resetPlayer();

//       print('before setSource: ${_player.state} ');
//       await _player
//           .setSource(DeviceFileSource(newTrackUrl, mimeType: 'audio/mpeg'));

//       print('after setSource: ${_player.state} ');
//       // await _player.resume();
//       print('end of preparesource');
//       notifyListeners();
//     } catch (e) {
//       _logger.error(e);
//     }
//   }

//   Future<void> configure() async {
//     _player.setReleaseMode(ReleaseMode.stop);

//     // Start the player as soon as the app is displayed.

//     _durationSubscription = _player.onDurationChanged.listen((_duration) {
//       _duration = _duration;
//     });

//     _positionSubscription = _player.onPositionChanged.listen((p) {
//       _position = p;
//     });

//     _playerCompleteSubscription = _player.onPlayerComplete.listen((event) {
//       _position = Duration.zero;
//     });
//   }

//   @override
//   void dispose() {
//     // Release all sources and dispose the player.
//     _player.dispose();
//     _durationSubscription?.cancel();
//     _positionSubscription?.cancel();
//     _playerCompleteSubscription?.cancel();
//     _playerStateChangeSubscription?.cancel();

//     super.dispose();
//   }

//   void seek(double _position) {
//     _player.seek(Duration(milliseconds: _position.round()));
//     notifyListeners();
//   }

//   void play() async {
//     try {
//       await _player.resume();
//       _logger.info(_player);
//       notifyListeners();
//     } catch (e) {
//       _logger.error(e);
//       _logger.info(_player);
//     }
//   }

//   void pause() async {
//     try {
//       await _player.pause();
//       _logger.info(_player);
//       notifyListeners();
//     } catch (e) {
//       _logger.error(e);
//       _logger.info(_player);
//     }
//   }
// }
