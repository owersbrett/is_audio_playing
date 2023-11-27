import 'package:flutter_test/flutter_test.dart';
import 'package:is_audio_playing/is_audio_playing.dart';
import 'package:is_audio_playing/is_audio_playing_platform_interface.dart';
import 'package:is_audio_playing/is_audio_playing_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIsAudioPlayingPlatform
    with MockPlatformInterfaceMixin
    implements IsAudioPlayingPlatform {

  @override
  Future<bool?> isAudioPlaying() => Future.value(true);
}

void main() {
  final IsAudioPlayingPlatform initialPlatform = IsAudioPlayingPlatform.instance;

  test('$MethodChannelIsAudioPlaying is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIsAudioPlaying>());
  });

  test('isAudioPlaying', () async {
    IsAudioPlaying isAudioPlayingPlugin = IsAudioPlaying();
    MockIsAudioPlayingPlatform fakePlatform = MockIsAudioPlayingPlatform();
    IsAudioPlayingPlatform.instance = fakePlatform;

    expect(await isAudioPlayingPlugin.isAudioPlaying(), true);
  });
}
