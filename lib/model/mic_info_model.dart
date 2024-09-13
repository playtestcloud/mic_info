class Device {
  // Class properties for the product name and id of the device
  String productName;
  String id;

  // Constructor to initialize the product name and id, both required
  Device({required this.productName, required this.id});

  // Method to convert a Device object to a Map (useful for serialization)
  Map<String, String> toMap() {
    return {
      'productName': productName, // Map the product name
      'id': id, // Map the id
    };
  }

  // Factory constructor to create a Device object from a Map (useful for deserialization)
  // The map might contain dynamic types, so type-casting is necessary
  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      productName: map['productName'] ??
          '', // If 'productName' is null, default to an empty string
      id: map['id'] ?? '', // If 'id' is null, default to an empty string
    );
  }

  // Override the toString method to return a readable string representation of the Device object
  @override
  String toString() {
    return 'productName: $productName, id: $id\n';
  }
}
