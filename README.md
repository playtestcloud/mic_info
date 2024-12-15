# Mic Info Plugin

The **Mic Info Plugin** allows Flutter applications to retrieve information about connected microphones on Android and iOS devices, including active, default, wired, and Bluetooth microphones.

## Features

- **Active Microphone Detection**: Retrieve the active microphones that have an active recording in progress.
- **Built-in Microphone Detection**: Retrieve the default microphones available on the device.
- **Wired and USB Microphone Detection**: Detect wired headsets, including USB connector microphones.
- **Bluetooth Microphone Detection**: Identify and list Bluetooth microphones for hands-free audio input.
- **Cross-Platform Support**: Works seamlessly on both Android and iOS.

## Platforms Supported

- **Android**: API Level 24 (Android 7.0) and above.
- **iOS**: iOS 10.0 and above.

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
  // Retrieve Active Microphones
  List<MicInfoDevice> activeMicrophones = await MicInfo.getActiveMicrophones();
  print("Active Microphones: $activeMicrophones");

  // Retrieve Bluetooth Microphones
  List<MicInfoDevice> bluetoothMicrophones = await MicInfo.getBluetoothMicrophones();
  print("Bluetooth Microphones: $bluetoothMicrophones");

  // Retrieve Default Microphones
  List<MicInfoDevice> defaultMicrophones = await MicInfo.getDefaultMicrophones();
  print("Default Microphones: $defaultMicrophones");

  // Retrieve Wired Microphones
  List<MicInfoDevice> wiredMicrophones = await MicInfo.getWiredMicrophones();
  print("Wired Microphones: $wiredMicrophones");
}
```

### MicInfoDevice Model
The information about each microphone is returned as a list of `MicInfoDevice` objects. Each device contains:
- `id`: The unique identifier of the microphone.
- `productName`: The name of the microphone.

### Permissions
Ensure that you have the appropriate permissions for accessing the microphone on both Android and iOS. This plugin doesn't handle permissions.

#### Android
Add the following permission in your `AndroidManifest.xml` file:
```
<uses-permission android:name="android.permission.RECORD_AUDIO"/>
```

#### iOS
In the `ios/Runner/Info.plist` file, add:
```
<key>NSMicrophoneUsageDescription</key>
<string>This app needs access to your microphone.</string>
```

## Platform-Specific Implementation
### Android
This plugin uses `AudioManager` and `AudioDeviceInfo` to detect connected microphones on Android devices.

### iOS
For iOS, the plugin uses `AVAudioSession` to retrieve microphone information, including Bluetooth and wired devices.

## Troubleshooting
- Ensure that the app has permission to use the microphone.
- Check that the connected microphones are supported by your device.

## Contributions
- Special thanks to
[GitHub: Cristian Zazo](https://github.com/Zazo032) for adding the active microphone feature.

Contributions are welcome! Please feel free to submit pull requests or open issues.
- GitHub: https://github.com/devakar-dhiman/mic_info.git