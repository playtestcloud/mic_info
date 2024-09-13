import Foundation
import AVFoundation

/// Function to check if a Bluetooth microphone is connected
/// - Returns: Array of dictionaries containing product name and id of Bluetooth microphones
func isBluetoothMicrophoneConnected() -> [ [String: Any]] {
    
    typealias mapData = [String: Any]
    var listData: [mapData] = []
    
    // Get the available audio inputs (microphones)
    let outputs = Manager.recordingSession.availableInputs
    
    // Loop through the available inputs
    for output in outputs! {
        // Check if the input type is a Bluetooth microphone
        if convertFromAVAudioSessionPort(output.portType) == convertFromAVAudioSessionPort(AVAudioSession.Port.bluetoothHFP) {
            // If yes, append the product name and id to the list
            listData.append(["productName": output.portName, "id": output.uid])
        }
    }
    print("dhiman_singh", listData)
    return listData
}

/// Function to check if a wired microphone (e.g., headset) is connected
/// - Returns: Array of dictionaries containing product name and id of wired microphones
func isWiredMicrophoneConnected() -> [ [String: Any]] {
    let audioSession = AVAudioSession.sharedInstance()
    
    typealias mapData = [String: Any]
    var listData: [mapData] = []
    
    // Get the available audio inputs
    let currentRoute = audioSession.availableInputs
    
    // Loop through the available inputs
    for output in currentRoute! {
        // Check if the input type is a wired headset microphone
        if convertFromAVAudioSessionPort(output.portType) == convertFromAVAudioSessionPort(AVAudioSession.Port.headsetMic) {
            // If yes, append the product name and id to the list
            listData.append(["productName": output.portName, "id": output.uid])
        }
    }
    print("dhiman_singh", listData)
    return listData
}

/// Function to check if the default (built-in) microphone is connected
/// - Returns: Array of dictionaries containing product name and id of built-in microphones
func isDefaultMicrophoneConnected() -> [ [String: Any]] {
    let audioSession = AVAudioSession.sharedInstance()
    
    typealias mapData = [String: Any]
    var listData: [mapData] = []
    
    // Get the available audio inputs
    let currentRoute = audioSession.availableInputs
    
    // Loop through the available inputs
    for output in currentRoute! {
        // Check if the input type is a built-in microphone
        if convertFromAVAudioSessionPort(output.portType) == convertFromAVAudioSessionPort(AVAudioSession.Port.builtInMic) {
            // If yes, append the product name and id to the list
            listData.append(["productName": output.portName, "id": output.uid])
        }
    }
    print("dhiman_singh", listData)
    return listData
}

/// Helper function to convert AVAudioSession port type to a string
/// - Parameter input: AVAudioSession.Port
/// - Returns: String representation of the AVAudioSession port
fileprivate func convertFromAVAudioSessionPort(_ input: AVAudioSession.Port) -> String {
    return input.rawValue
}

/// Function to check and request microphone permission from the user
func CheckForPermission() {
    // Set up the AVAudioSession
    Manager.recordingSession = AVAudioSession.sharedInstance()
    do {
        // Configure the session for play and record with Bluetooth and other options
        try Manager.recordingSession.setCategory(.playAndRecord, options: [.allowBluetooth, .defaultToSpeaker, .mixWithOthers, .duckOthers])
        
        // Request microphone permission from the user
        Manager.recordingSession.requestRecordPermission({ (allowed) in
            if allowed {
                Manager.micAuthorised = true // Set the micAuthorized flag to true if permission is granted
            } else {
                Manager.micAuthorised = false // Set the micAuthorized flag to false if permission is denied
            }
        })
        
        // Notify the app's main thread to update UI or trigger other actions
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateLabel"), object: nil)
        }
    } catch {
        // Handle any errors that occur while setting the audio session category
        print("Failed to set Category", error.localizedDescription)
    }
}

/// Manager struct to handle audio session and microphone permission
struct Manager {
    // Required Objects - AVFoundation
    
    /// AVAudioSession to manage the audio recording session
    static var recordingSession: AVAudioSession!
    
    /// Boolean to check if microphone permission is granted
    static var micAuthorised = Bool()
}
