import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mic_info_platform_interface.dart';

/// An implementation of [MicInfoPlatform] that uses method channels to communicate
/// with the native (Android/iOS) platform.
class MethodChannelMicInfo extends MicInfoPlatform {
  /// The method channel used to interact with the native platform.
  /// This method channel is responsible for invoking platform-specific methods.
  @visibleForTesting
  final methodChannel = const MethodChannel('mic_info');

  /// Retrieves the default microphone using a method channel call to the native platform.
  @override
  Future<List> getDefaultMicrophone() async {
    // Invoke the 'getDefaultMicrophone' method on the method channel
    // The native platform will return a list of microphones, or an empty list if none found.
    List list =
        (await methodChannel.invokeMethod<List>('getDefaultMicrophone')) ?? [];
    return list;
  }

  /// Retrieves the wired microphone using a method channel call to the native platform.
  @override
  Future<List> getWiredMicrophone() async {
    // Invoke the 'getWiredMicrophone' method on the method channel
    // The native platform will return a list of wired microphones, or an empty list if none found.
    List list =
        (await methodChannel.invokeMethod<List>('getWiredMicrophone')) ?? [];
    return list;
  }

  /// Retrieves the Bluetooth microphone using a method channel call to the native platform.
  @override
  Future<List> getBluetoothMicrophone() async {
    // Invoke the 'getBluetoothMicrophone' method on the method channel
    // The native platform will return a list of Bluetooth microphones, or an empty list if none found.
    List list =
        (await methodChannel.invokeMethod<List>('getBluetoothMicrophone')) ??
            [];
    return list;
  }
}
