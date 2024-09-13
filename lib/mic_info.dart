import 'mic_info_platform_interface.dart';
import 'model/mic_info_model.dart';

/// A class that provides functionality to retrieve microphone information from the platform.
/// It uses the platform interface to fetch data about connected microphones and converts them to `Device` objects.
class MicInfo {
  /// Retrieves the default microphone available on the device.
  /// It fetches the data via the platform interface, converts it into a list of `Device` objects, and returns it.
  Future<List<Device>> getDefaultMicrophone() async {
    // Initialize an empty list of devices.
    List<Device> devices = [];

    // Get the microphone data from the platform interface.
    List temp = await MicInfoPlatform.instance.getDefaultMicrophone();

    // Check if the data is not empty.
    if (temp.isNotEmpty) {
      // Convert each item in the list to a Map with 'productName' and 'id'.
      List<Map<String, dynamic>> mapList = temp.map((obj) {
        return {
          'productName':
              obj["productName"] ?? '', // Default to an empty string if null.
          'id': obj["id"] ?? '', // Default to an empty string if null.
        };
      }).toList();

      // Convert each map to a Device object and add it to the devices list.
      for (var element in mapList) {
        devices.add(Device.fromMap(element));
      }
    }

    // Return the list of devices.
    return devices;
  }

  /// Retrieves the wired microphone (e.g., headset) available on the device.
  /// It fetches the data via the platform interface, converts it into a list of `Device` objects, and returns it.
  Future<List<Device>> getWiredMicrophone() async {
    // Initialize an empty list of devices.
    List<Device> devices = [];

    // Get the wired microphone data from the platform interface.
    List temp = await MicInfoPlatform.instance.getWiredMicrophone();

    // Check if the data is not empty.
    if (temp.isNotEmpty) {
      // Convert each item in the list to a Map with 'productName' and 'id'.
      List<Map<String, dynamic>> mapList = temp.map((obj) {
        return {
          'productName':
              obj["productName"] ?? '', // Default to an empty string if null.
          'id': obj["id"] ?? '', // Default to an empty string if null.
        };
      }).toList();

      // Convert each map to a Device object and add it to the devices list.
      for (var element in mapList) {
        devices.add(Device.fromMap(element));
      }
    }

    // Return the list of devices.
    return devices;
  }

  /// Retrieves the Bluetooth microphone available on the device.
  /// It fetches the data via the platform interface, converts it into a list of `Device` objects, and returns it.
  Future<List<Device>> getBluetoothMicrophone() async {
    // Initialize an empty list of devices.
    List<Device> devices = [];

    // Get the Bluetooth microphone data from the platform interface.
    List temp = await MicInfoPlatform.instance.getBluetoothMicrophone();

    // Check if the data is not empty.
    if (temp.isNotEmpty) {
      // Convert each item in the list to a Map with 'productName' and 'id'.
      List<Map<String, dynamic>> mapList = temp.map((obj) {
        return {
          'productName':
              obj["productName"] ?? '', // Default to an empty string if null.
          'id': obj["id"] ?? '', // Default to an empty string if null.
        };
      }).toList();

      // Convert each map to a Device object and add it to the devices list.
      for (var element in mapList) {
        devices.add(Device.fromMap(element));
      }
    }

    // Return the list of devices.
    return devices;
  }
}
