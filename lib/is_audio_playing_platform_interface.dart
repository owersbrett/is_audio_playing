import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'is_audio_playing_method_channel.dart';

abstract class IsAudioPlayingPlatform extends PlatformInterface {
  /// Constructs a IsAudioPlayingPlatform.
  IsAudioPlayingPlatform() : super(token: _token);

  static final Object _token = Object();

  static IsAudioPlayingPlatform _instance = MethodChannelIsAudioPlaying();

  /// The default instance of [IsAudioPlayingPlatform] to use.
  ///
  /// Defaults to [MethodChannelIsAudioPlaying].
  static IsAudioPlayingPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IsAudioPlayingPlatform] when
  /// they register themselves.
  static set instance(IsAudioPlayingPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> isAudioPlaying() {
    return MethodChannelIsAudioPlaying().isAudioPlaying();
  }
}
