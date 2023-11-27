import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:is_audio_playing/is_audio_playing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _message = 'Unknown';
  bool _isAudioPlaying = false;
  final _isAudioPlayingPlugin = IsAudioPlaying();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {

    bool? isAudioPlaying;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      isAudioPlaying =
          await _isAudioPlayingPlugin.isAudioPlaying();
    } on PlatformException {
      _message = 'Failed to determine if audio is playing.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _isAudioPlaying = isAudioPlaying ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Audio Playing Example App'),
        ),
        body: Center(
          child: Text('The statement "Audio is playing on this device" is: $_isAudioPlaying'),
        ),
      ),
    );
  }
}
