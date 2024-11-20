import Foundation
import AVFoundation

/// Function to retrieve the currently active microphone
/// - Returns: Array of dictionaries containing product name and id of active microphones
func getActiveMicrophones() -> [[String: Any]] {
    var activeMicrophones: [[String: Any]] = []
    let audioSession = AVAudioSession.sharedInstance()
    
    let currentRoute = audioSession.currentRoute
    
    for input in currentRoute.inputs {
        activeMicrophones.append(["id": input.uid, "productName": input.portName])
    }
    
    return activeMicrophones
}

/// Function to check if a Bluetooth microphone is connected
/// - Returns: Array of dictionaries containing product name and id of Bluetooth microphones
func getBluetoothMicrophones() -> [[String: Any]] {
    var listData: [[String: Any]] = []
    
    if let inputs = AVAudioSession.sharedInstance().availableInputs {
        for input in inputs where input.portType == .bluetoothHFP {
            listData.append(["id": input.uid, "productName": input.portName])
        }
    }
    
    return listData
}

/// Function to check if the default (built-in) microphone is connected
/// - Returns: Array of dictionaries containing product name and id of built-in microphones
func getDefaultMicrophones() -> [[String: Any]] {
    var listData: [[String: Any]] = []
    
    if let inputs = AVAudioSession.sharedInstance().availableInputs {
        for input in inputs where input.portType == .builtInMic {
            listData.append(["id": input.uid, "productName": input.portName])
        }
    }
    
    return listData
}

/// Function to check if a wired microphone (e.g., headset) is connected
/// - Returns: Array of dictionaries containing product name and id of wired microphones
func getWiredMicrophones() -> [[String: Any]] {
    var listData: [[String: Any]] = []
    
    if let inputs = AVAudioSession.sharedInstance().availableInputs {
        for input in inputs where input.portType == .headsetMic {
            listData.append(["id": input.uid, "productName": input.portName])
        }
    }
    
    return listData
}
