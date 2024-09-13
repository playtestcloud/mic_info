# Mic Info Plugin

The **Mic Info Plugin** allows Flutter applications to retrieve information about connected microphones on Android and iOS devices, including default, wired, and Bluetooth microphones.

## Features

- Retrieve the list of built-in (default) microphones.
- Retrieve the list of wired microphones (e.g., headset mics).
- Retrieve the list of Bluetooth microphones.

## Platforms Supported

- **Android**: API Level 23 (Android 6.0) and above.
- **iOS**: iOS 10.0 and above.

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  mic_info: ^0.0.1  # Use the latest version
```

Run the following command to install the package:
```
flutter pub get
```

## Usage
### Import the Plugin  
To use this plugin, import it in your Dart file:
```
import 'package:mic_info/mic_info.dart';
```
### Example: Retrieving Microphone Information
You can retrieve information about the default, wired, and Bluetooth microphones using the following methods:

```
import 'package:mic_info/mic_info.dart';
import 'package:mic_info/model/mic_info_model.dart';

void getMicrophoneInfo() async {
  final micInfo = MicInfo();

  // Retrieve Default Microphone
  List<Device> defaultMicrophones = await micInfo.getDefaultMicrophone();
  print("Default Microphones: $defaultMicrophones");

  // Retrieve Wired Microphone
  List<Device> wiredMicrophones = await micInfo.getWiredMicrophone();
  print("Wired Microphones: $wiredMicrophones");

  // Retrieve Bluetooth Microphone
  List<Device> bluetoothMicrophones = await micInfo.getBluetoothMicrophone();
  print("Bluetooth Microphones: $bluetoothMicrophones");
}
```

### Device Model
The information about each microphone is returned as a list of Device objects:
```
class Device {
  String productName;
  String id;

  Device({required this.productName, required this.id});

  @override
  String toString() {
    return 'Device(productName: $productName, id: $id)';
  }
}
```
Each device contains:

- productName: The name of the microphone.
- id: The unique identifier of the microphone.

### Permissions
Ensure that you have the appropriate permissions for accessing the microphone on both Android and iOS.

#### Android
Add the following permission in your AndroidManifest.xml file:
```
<uses-permission android:name="android.permission.RECORD_AUDIO"/>
```

#### iOS
In the ios/Runner/Info.plist file, add:
```
<key>NSMicrophoneUsageDescription</key>
<string>This app needs access to your microphone.</string>
```

## Platform-Specific Implementation
### Android
This plugin uses AudioManager and AudioDeviceInfo to detect connected microphones on Android devices.

### iOS
For iOS, the plugin uses AVAudioSession to retrieve microphone information, including Bluetooth and wired devices.

## Troubleshooting
-Ensure that the app has permission to use the microphone.
-Check that the connected microphones are supported by your device.

## Contributions
Contributions are welcome! Please feel free to submit pull requests or open issues.
- github: https://github.com/devakar-dhiman/mic_info.git