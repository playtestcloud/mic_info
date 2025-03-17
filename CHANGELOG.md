# Changelog

All notable changes to this project will be documented in this file.

## [0.0.7]
### Bug fix
- Fixed bug in `getActiveMicrophones` when the information cannot be retrieved in Android.

## [0.0.6]
### Bug fix
- Fixed bugs and code structure

## [0.0.5]
### Added
- Added logic to check for microphone permission in ios devices.

## [0.0.4]
### Added
- Fixed a bug related to ios apps for not detecting the bluetooth devices when app is opened after connecting the bluetooth device.

## [0.0.3]
### Added
- Logic to detect microphones active microphones that have an active recording in progress.
- Lowered minimum supported Dart version to 3.4.0.
- **Breaking change**: Increased minimum supported Android version to Android 7.0 (API 24).
- **Breaking change**: Renamed methods to clearly reflect that the return type is a `List<MicInfoDevice>`: `getDefaultMicrophone()` -> `getDefaultMicrophones()`.
- **Breaking change**: `MicInfo` no longer needs to be instantiated: `MicInfo().getDefaultMicrophones()` -> `MicInfo.getDefaultMicrophones()`.

## [0.0.2]
### Added
- Logic to detect USB connector microphones as part of wired microphones.
- Updated detection for `AudioDeviceInfo.TYPE_WIRED_HEADSET` and `AudioDeviceInfo.TYPE_USB_HEADSET` under the category of wired microphones.

### Fixed
- Minor code improvements and optimizations.

## [0.0.1]
- Added support for retrieving default, wired, and Bluetooth microphone information on Android and iOS platforms.
- Provided methods to:
    - Get the list of built-in (default) microphones.
    - Get the list of wired microphones (e.g., headset mics).
    - Get the list of Bluetooth microphones.
- Included platform-specific implementation for Android using `AudioManager` and `AudioDeviceInfo`.
- Included platform-specific implementation for iOS using `AVAudioSession`.
- Added `Device` model to represent microphone devices with `productName` and `id` attributes.
- Ensured microphone permissions are handled for Android (`RECORD_AUDIO`) and iOS (`NSMicrophoneUsageDescription`).
