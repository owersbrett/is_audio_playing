
import 'is_audio_playing_platform_interface.dart';

class IsAudioPlaying {
  Future<bool?> isAudioPlaying() {
    return IsAudioPlayingPlatform.instance.isAudioPlaying();
  }
}
