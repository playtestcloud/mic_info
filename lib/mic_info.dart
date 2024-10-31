import 'package:mic_info/mic_info_platform_interface.dart';
import 'package:mic_info/model/mic_info_model.dart';

/// A class that provides functionality to retrieve microphone information from the platform.
/// It uses the platform interface to fetch data about connected microphones and converts them to `Device` objects.
class MicInfo {
  // Disable public constructor.
  MicInfo._();

  /// Retrieves the default microphone available on the device.
  /// It fetches the data via the platform interface, converts it into a list of `Device` objects, and returns it.
  static Future<List<MicInfoDevice>> getActiveMicrophones() async {
    // Initialize an empty list of devices.
    final devices = <MicInfoDevice>[];

    // Get the active microphones data from the platform interface.
    final temp = await MicInfoPlatform.instance.getActiveMicrophones();

    // Convert each device object and add it to the devices list.
    for (final device in temp) {
      devices.add(MicInfoDevice.fromMap(device));
    }

    // Return the list of devices.
    return devices;
  }

  /// Retrieves the Bluetooth microphones available on the device.
  /// It fetches the data via the platform interface, converts it into a list of `Device` objects, and returns it.
  static Future<List<MicInfoDevice>> getBluetoothMicrophones() async {
    // Initialize an empty list of devices.
    final List<MicInfoDevice> devices = [];

    // Get the Bluetooth microphones data from the platform interface.
    final List temp = await MicInfoPlatform.instance.getBluetoothMicrophones();

    // Convert each device object and add it to the devices list.
    for (final device in temp) {
      devices.add(MicInfoDevice.fromMap(device));
    }

    // Return the list of devices.
    return devices;
  }

  /// Retrieves the default microphones available on the device.
  /// It fetches the data via the platform interface, converts it into a list of `Device` objects, and returns it.
  static Future<List<MicInfoDevice>> getDefaultMicrophones() async {
    // Initialize an empty list of devices.
    final List<MicInfoDevice> devices = [];

    // Get the microphones data from the platform interface.
    final List temp = await MicInfoPlatform.instance.getDefaultMicrophones();

    // Convert each device object and add it to the devices list.
    for (final device in temp) {
      devices.add(MicInfoDevice.fromMap(device));
    }

    // Return the list of devices.
    return devices;
  }

  /// Retrieves the wired microphones (e.g., headset) available on the device.
  /// It fetches the data via the platform interface, converts it into a list of `Device` objects, and returns it.
  static Future<List<MicInfoDevice>> getWiredMicrophones() async {
    // Initialize an empty list of devices.
    final List<MicInfoDevice> devices = [];

    // Get the wired microphones data from the platform interface.
    final List temp = await MicInfoPlatform.instance.getWiredMicrophones();

    // Convert each device object and add it to the devices list.
    for (final device in temp) {
      devices.add(MicInfoDevice.fromMap(device));
    }

    // Return the list of devices.
    return devices;
  }
}
