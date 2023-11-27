import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'is_audio_playing_platform_interface.dart';

/// An implementation of [IsAudioPlayingPlatform] that uses method channels.
class MethodChannelIsAudioPlaying extends IsAudioPlayingPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('is_audio_playing');

  @override
  Future<bool?> isAudioPlaying() async {
    final isPlaying = await methodChannel.invokeMethod<bool>('isAudioPlaying');
    return isPlaying;
  }
}
