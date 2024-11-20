import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mic_info/mic_info_platform_interface.dart';

/// An implementation of [MicInfoPlatform] that uses method channels to communicate
/// with the native (Android/iOS) platform.
class MethodChannelMicInfo extends MicInfoPlatform {
  /// The method channel used to interact with the native platform.
  /// This method channel is responsible for invoking platform-specific methods.
  @visibleForTesting
  final methodChannel = const MethodChannel('dhiman/mic_info');

  /// Retrieves the Bluetooth microphone using a method channel call to the native platform.
  @override
  Future<List<dynamic>> getActiveMicrophones() async {
    // Invoke the 'getCommunicationDevice' method on the method channel
    // The native platform will return the currently selected microphone for communication, or null if not found.
    return await methodChannel.invokeMethod<List<dynamic>>('getActiveMicrophones') ?? <Map<String, String>>[];
  }

  /// Retrieves the Bluetooth microphone using a method channel call to the native platform.
  @override
  Future<List<dynamic>> getBluetoothMicrophones() async {
    // Invoke the 'getBluetoothMicrophones' method on the method channel
    // The native platform will return a list of Bluetooth microphones, or an empty list if none found.
    return (await methodChannel.invokeMethod<List<dynamic>>('getBluetoothMicrophones')) ?? <Map<String, String>>[];
  }

  /// Retrieves the default microphone using a method channel call to the native platform.
  @override
  Future<List<dynamic>> getDefaultMicrophones() async {
    // Invoke the 'getDefaultMicrophones' method on the method channel
    // The native platform will return a list of microphones, or an empty list if none found.
    return (await methodChannel.invokeMethod<List<dynamic>>('getDefaultMicrophones')) ?? <Map<String, String>>[];
  }

  /// Retrieves the wired microphone using a method channel call to the native platform.
  @override
  Future<List<dynamic>> getWiredMicrophones() async {
    // Invoke the 'getWiredMicrophones' method on the method channel
    // The native platform will return a list of wired microphones, or an empty list if none found.
    return (await methodChannel.invokeMethod<List<dynamic>>('getWiredMicrophones')) ?? <Map<String, String>>[];
  }
}
