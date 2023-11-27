import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:is_audio_playing/is_audio_playing_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelIsAudioPlaying platform = MethodChannelIsAudioPlaying();
  const MethodChannel channel = MethodChannel('is_audio_playing');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.isAudioPlaying(), '42');
  });
}
