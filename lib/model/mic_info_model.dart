/// The information of a microphone device.
final class MicInfoDevice {
  /// The id of the device.
  final String id;

  /// The name of the device.
  final String productName;

  /// Default const constructor.
  const MicInfoDevice({required this.id, required this.productName});

  /// Method to convert a Device object to a Map (useful for serialization)
  Map<String, String> toMap() {
    return <String, String>{
      'id': id,
      'productName': productName,
    };
  }

  /// Factory constructor to create a [MicInfoDevice] object from the [Map] returned from the native side.
  factory MicInfoDevice.fromMap(Map<dynamic, dynamic> map) {
    return MicInfoDevice(
      id: (map['id'] as String?) ?? '',
      productName: (map['productName'] as String?) ?? '',
    );
  }

  @override
  String toString() {
    return 'MicInfoDevice(id: $id, productName: $productName)';
  }
}
