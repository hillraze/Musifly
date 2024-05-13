import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musifly/analytics/mus.logger.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:musifly/data/models/song/song.model.dart';
import 'package:musifly/utils/locator_service.dart';
import 'package:path_provider/path_provider.dart';

class PlayerNotifier extends ChangeNotifier {
  PlayerNotifier() {
    _player = AudioPlayer();
    // Assuming you want to start with stopped state
  }
  late AudioPlayer _player;
  // PlayerState? _playerStatus = PlayerState.stopped;

  Duration? _duration;
  Duration? _position;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  SongModel? _track;
  SongModel? get track => _track;

  // set track(SongModel? newTrack) {
  //   _track = newTrack;
  //   notifyListeners();
  // }

  void setTrack(SongModel newTrack) {
    _track = newTrack;
    prepareSource(newTrack.audioLink);
    // notifyListeners();
  }

  String get durationText => _duration?.toString().split('.').first ?? '';

  String get positionText => _position?.toString().split('.').first ?? '';

  Duration? get duration => _duration;
  Duration? get position => _position;

  static final _logger = MusLogger("PlayerNotifier");
  PlayerState get playerStatus => _player.state;

  void resetPlayer() {
    // case 1: first visit on track
    if (_duration == null ||
        _position == null ||
        _player.state != PlayerState.stopped) {
      _duration = Duration.zero;
      _position = Duration.zero;
      _player.stop();
    }
  }

  Future<File> downloadTrack(String url, String filename) async {
    // Get the directory where files can be saved
    Directory directory = await getApplicationDocumentsDirectory();
    String filePath = '${directory.path}/$filename';

    // Fetch data from the given URL
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // Write the file data to the desired file
      File file = File(filePath);
      return await file.writeAsBytes(response.bodyBytes);
    } else {
      throw Exception('Failed to download file');
    }
  }

  Future<void> prepareSource(String newTrackUrl) async {
    try {
      print(_player.source.toString());
      final oldTrackUrl = _player.source.toString();

      // case: we already prepared this track
      if (newTrackUrl == oldTrackUrl) return;

      // use resetPlayer when trackUrl is declared now or just updated
      //
      resetPlayer();

      await _player
          .setSource(DeviceFileSource(newTrackUrl, mimeType: 'audio/mpeg'));
      // await _player.resume();
      print('end of preparesource');
      notifyListeners();
    } catch (e) {
      _logger.error(e);
    }
  }

  Future<void> configure() async {
    _player.setReleaseMode(ReleaseMode.stop);

    // Start the player as soon as the app is displayed.

    _durationSubscription = _player.onDurationChanged.listen((_duration) {
      _duration = _duration;
    });

    _positionSubscription = _player.onPositionChanged.listen((p) {
      _position = p;
    });

    _playerCompleteSubscription = _player.onPlayerComplete.listen((event) {
      _position = Duration.zero;
    });
  }

  @override
  void dispose() {
    // Release all sources and dispose the player.
    _player.dispose();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();

    super.dispose();
  }

  void seek(double _position) {
    _player.seek(Duration(milliseconds: _position.round()));
    notifyListeners();
  }

  void play() async {
    try {
      await _player.resume();
      _logger.info(_player);
      notifyListeners();
    } catch (e) {
      _logger.error(e);
      _logger.info(_player);
    }
  }

  void pause() async {
    try {
      await _player.pause();
      _logger.info(_player);
      notifyListeners();
    } catch (e) {
      _logger.error(e);
      _logger.info(_player);
    }
  }
}
