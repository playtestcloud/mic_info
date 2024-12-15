import Flutter
import UIKit

// MicInfoPlugin class that implements the FlutterPlugin protocol
public class MicInfoPlugin: NSObject, FlutterPlugin {
  
  // Register the plugin with the Flutter plugin registrar
  public static func register(with registrar: FlutterPluginRegistrar) {
    // Set up the communication channel between Flutter and iOS native code
    let channel = FlutterMethodChannel(name: "dhiman/mic_info", binaryMessenger: registrar.messenger())
    
    // Create an instance of the plugin and set it as the method call delegate
    let instance = MicInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  // Handle method calls coming from Flutter
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    // Switch statement to handle different method calls
    switch call.method {

        // Case for getting the active microphones
        case "getActiveMicrophones":
            // Get the active microphones and return the result to Flutter
            let microphones = getActiveMicrophones()
            result(microphones)

        // Case for getting the Bluetooth microphone
        case "getBluetoothMicrophones":
            // check for the microphone permission
            checkForPermission()
            // Get the Bluetooth microphones and return the result to Flutter
            let microphones = getBluetoothMicrophones()
            result(microphones)
        
        // Case for getting the default built-in microphone
        case "getDefaultMicrophones":
            // Get the default built-in microphones and return the result to Flutter
            let microphones = getDefaultMicrophones()
            result(microphones)
        
        // Case for getting the wired microphone
        case "getWiredMicrophones":
            // check for the microphone permission
            checkForPermission()
            // Get the wired microphones and return the result to Flutter
            let microphones = getWiredMicrophones()
            result(microphones)
        
        // Default case if the method is not implemented
        default:
            result(FlutterMethodNotImplemented)
    }
  }
}
