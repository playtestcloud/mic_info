import Flutter
import UIKit

// MicInfoPlugin class that implements the FlutterPlugin protocol
public class MicInfoPlugin: NSObject, FlutterPlugin {
  
  // Register the plugin with the Flutter plugin registrar
  public static func register(with registrar: FlutterPluginRegistrar) {
    // Set up the communication channel between Flutter and iOS native code
    let channel = FlutterMethodChannel(name: "mic_info", binaryMessenger: registrar.messenger())
    
    // Create an instance of the plugin and set it as the method call delegate
    let instance = MicInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  // Handle method calls coming from Flutter
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    // Switch statement to handle different method calls
    switch call.method {
        
        // Case for getting the wired microphone
        case "getWiredMicrophone":
            // Check for permission before accessing microphones
            CheckForPermission()
            // Get the wired microphones and return the result to Flutter
            let microphones = isWiredMicrophoneConnected()
            result(microphones)
        
        // Case for getting the default built-in microphone
        case "getDefaultMicrophone":
            // Get the default built-in microphones and return the result to Flutter
            let microphones = isDefaultMicrophoneConnected()
            result(microphones)
        
        // Case for getting the Bluetooth microphone
        case "getBluetoothMicrophone":
            // Check for permission before accessing microphones
            CheckForPermission()
            // Get the Bluetooth microphones and return the result to Flutter
            let microphones = isBluetoothMicrophoneConnected()
            result(microphones)
        
        // Default case if the method is not implemented
        default:
            result(FlutterMethodNotImplemented)
    }
  }
}
