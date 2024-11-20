package com.dhiman.mic_info

import android.content.Context
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.os.Build
import androidx.annotation.RequiresApi
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** MicInfoPlugin - This is the main plugin class which implements
  * FlutterPlugin and MethodCallHandler to handle method calls from Dart/Flutter side.
  */
class MicInfoPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  // The MethodChannel is used for communication between Flutter and native Android
  private lateinit var channel : MethodChannel
  private lateinit var context: Context

  // Called when the plugin is attached to the Flutter engine
  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    // Set up the MethodChannel for communication with Dart
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "dhiman/mic_info")
    channel.setMethodCallHandler(this) // Set the handler for method calls from Flutter
  }

  // Handles method calls from Flutter
  @RequiresApi(Build.VERSION_CODES.N)
  override fun onMethodCall(call: MethodCall, result: Result) {
    when(call.method){
      "getActiveMicrophones" -> {
        // If Flutter calls 'getActiveMicrophones', fetch the active microphones and return
        // A microphone is considered active if it's currently recording audio
        val microphones = getActiveMicrophones()
        result.success(microphones)
      }
      "getBluetoothMicrophones" -> {
        // If Flutter calls 'getBluetoothMicrophones', fetch the Bluetooth microphones and return
        val microphones = getBluetoothMicrophones()
        result.success(microphones)
      }
      "getDefaultMicrophones" -> {
        // If Flutter calls 'getDefaultMicrophones', fetch the default microphones and return
        val microphones = getDefaultMicrophones()
        result.success(microphones)
      }
      "getWiredMicrophones" -> {
        // If Flutter calls 'getWiredMicrophones', fetch the wired microphones and return
        val microphones = getWiredMicrophones()
        result.success(microphones)
      }
      else -> {
        // If the method is not implemented, return notImplemented
        result.notImplemented()
      }
    }
  }

  // Function to get the active microphones of the active recording sessions
  @RequiresApi(Build.VERSION_CODES.N)
  private fun getActiveMicrophones(): List<Map<String, String>> {
    val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    val recordingConfigurations = audioManager.getActiveRecordingConfigurations();
    val microphoneNames = mutableListOf<Map<String, String>>()

    for (config in recordingConfigurations) {
      val device = config.getAudioDevice()
      // Check if the device is a supported device microphone
      if (device.type == AudioDeviceInfo.TYPE_BLUETOOTH_SCO || device.type == AudioDeviceInfo.TYPE_BUILTIN_MIC || device.type == AudioDeviceInfo.TYPE_USB_HEADSET || device.type == AudioDeviceInfo.TYPE_WIRED_HEADSET ) {
        // Add the microphone information (product name and id) to the list
        microphoneNames.add(mapOf("productName" to device.productName.toString(), "id" to device.id.toString()))
      }
    }
    return microphoneNames // Return the list of Bluetooth microphones
  }

  // Function to get the Bluetooth microphones of the device
  @RequiresApi(Build.VERSION_CODES.M)
  private fun getBluetoothMicrophones(): List<Map<String, String>> {
    val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    val devices = audioManager.getDevices(AudioManager.GET_DEVICES_INPUTS)
    val microphoneNames = mutableListOf<Map<String, String>>()

    for (device in devices) {
      // Check if the device is a Bluetooth microphone
      if (device.type == AudioDeviceInfo.TYPE_BLUETOOTH_SCO) {
        // Add the microphone information (product name and id) to the list
        microphoneNames.add(mapOf("productName" to device.productName.toString(), "id" to device.id.toString()))
      }
    }
    return microphoneNames // Return the list of Bluetooth microphones
  }

  // Function to get the default (built-in) microphones of the device
  @RequiresApi(Build.VERSION_CODES.M)
  private fun getDefaultMicrophones(): List<Map<String, String>> {
    val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    val devices = audioManager.getDevices(AudioManager.GET_DEVICES_INPUTS)
    val microphoneNames = mutableListOf<Map<String, String>>()

    for (device in devices) {
      // Check if the device is a built-in microphone
      if (device.type == AudioDeviceInfo.TYPE_BUILTIN_MIC) {
        // Add the microphone information (product name and id) to the list
        microphoneNames.add(mapOf("productName" to device.productName.toString(), "id" to device.id.toString()))
      }
    }
    return microphoneNames // Return the list of built-in microphones
  }

  // Function to get the wired microphones (e.g. headset mic) of the device
  @RequiresApi(Build.VERSION_CODES.M)
  private fun getWiredMicrophones(): List<Map<String, String>> {
    val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    val devices = audioManager.getDevices(AudioManager.GET_DEVICES_INPUTS)
    val microphoneNames = mutableListOf<Map<String, String>>()

    for (device in devices) {
      // Check if the device is a wired headset microphone
      if (device.type == AudioDeviceInfo.TYPE_USB_HEADSET || device.type == AudioDeviceInfo.TYPE_WIRED_HEADSET) {
        // Add the microphone information (product name and id) to the list
        microphoneNames.add(mapOf("productName" to device.productName.toString(), "id" to device.id.toString()))
      }
    }
    return microphoneNames // Return the list of wired microphones
  }

  // Called when the plugin is attached to an activity
  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    context = binding.activity // Get the context from the activity
  }

  // Called when the activity is detached (due to configuration changes)
  override fun onDetachedFromActivityForConfigChanges() {
    // Handle activity detachment during configuration changes (e.g., screen rotation)
  }

  // Called when the activity is re-attached after configuration changes
  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    context = binding.activity // Get the context from the re-attached activity
  }

  // Called when the activity is completely detached
  override fun onDetachedFromActivity() {
    // Handle activity detachment
  }

  // Called when the plugin is detached from the Flutter engine
  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null) // Clean up the MethodChannel
  }
}
