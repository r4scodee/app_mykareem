// lib/services/audio_service.dart
import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playUrl(String url) async {
    try {
      await _player.stop();
      await _player.play(UrlSource(url));
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  Future<void> pause() async {
    try {
      await _player.pause();
    } catch (e) {
      print('Error pausing audio: $e');
    }
  }

  Future<void> resume() async {
    try {
      await _player.resume();
    } catch (e) {
      print('Error resuming audio: $e');
    }
  }

  Future<void> stop() async {
    try {
      await _player.stop();
    } catch (e) {
      print('Error stopping audio: $e');
    }
  }

  void dispose() {
    _player.dispose();
  }
}
