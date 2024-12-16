import Foundation
import AVFoundation

/// Function to retrieve the currently active microphone
/// - Returns: Array of dictionaries containing product name and id of active microphones
func getActiveMicrophones() -> [[String: Any]] {
    var activeMicrophones: [[String: Any]] = []
    let audioSession = Manager.recordingSession
    currentRoute = audioSession.currentRoute
    
    for input in currentRoute.inputs {
        activeMicrophones.append(["id": input.uid, "productName": input.portName])
    }
    
    return activeMicrophones
}

/// Function to check if a Bluetooth microphone is connected
/// - Returns: Array of dictionaries containing product name and id of Bluetooth microphones
func getBluetoothMicrophones() -> [[String: Any]] {
    var listData: [[String: Any]] = []
    
    if let inputs = Manager.recordingSession.availableInputs {
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
    
    if let inputs = Manager.recordingSession.availableInputs {
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
    
    if let inputs = Manager.recordingSession.availableInputs {
        for input in inputs where input.portType == .headsetMic {
            listData.append(["id": input.uid, "productName": input.portName])
        }
    }
    
    return listData
}

func CheckForPermission() {
    // Initialize the shared AVAudioSession instance
    let recordingSession = AVAudioSession.sharedInstance()

    // Assign the session to Manager's recording session
    Manager.recordingSession = recordingSession // Improved readability by using a local variable

    do {
        // Configure the audio session category and options
        // Changes:
        // - Added explicit category settings for better readability.
        // - .allowBluetooth: Enables Bluetooth audio input/output.
        // - .defaultToSpeaker: Defaults audio output to the device's speaker.
        // - .mixWithOthers: Allows app audio to mix with other audio sessions.
        // - .duckOthers: Temporarily reduces the volume of other audio while active.
        try recordingSession.setCategory(.playAndRecord, options: [.allowBluetooth, .defaultToSpeaker, .mixWithOthers, .duckOthers])

        try recordingSession.setActive(true)
        // Request microphone access permission
        recordingSession.requestRecordPermission { allowed in
            DispatchQueue.main.async {
                // Update Manager's microphone authorization status
                // Changes:
                // - Ensured updates happen on the main thread for thread safety.
                Manager.micAuthorised = allowed

                // Notify observers to update UI or handle state changes
                // Changes:
                // - Used Notification.Name for better practice.
                NotificationCenter.default.post(name: Notification.Name("updateLabel"), object: nil)
            }
        }
    } catch {
        // Log the error if setting the category fails
        // Changes:
        // - Improved error message clarity to describe the specific failure context.
        print("Failed to configure audio session: \(error.localizedDescription)")
    }
}


struct Manager {
    //Required Objects - AVFoundation
    ///AVAudio Session
    static var recordingSession: AVAudioSession!
    //Bool Values
    ///Bool To check mic permission
    static var micAuthorised = Bool()
    
}
