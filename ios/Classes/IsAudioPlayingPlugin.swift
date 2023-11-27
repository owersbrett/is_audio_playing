import AVFoundation
import Flutter
import UIKit

public class IsAudioPlayingPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "is_audio_playing", binaryMessenger: registrar.messenger())
    let instance = IsAudioPlayingPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "isAudioPlaying":
        let isPlaying = AVAudioSession.sharedInstance().isOtherAudioPlaying
        result(isPlaying)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
