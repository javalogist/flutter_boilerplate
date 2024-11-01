class UserModel {
  final String name;
  final String email;
  final String phone;
  final String dateOfBirth;
  final String address;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.dateOfBirth,
    required this.address,
  });

  // Convert a User object into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'dateOfBirth': dateOfBirth,
      'address': address,
    };
  }

  // Create a User object from a JSON map.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      address: json['address'] as String,
    );
  }

  // For debugging or display purposes.
  @override
  String toString() {
    return 'User{name: $name, email: $email, phone: $phone, dateOfBirth: $dateOfBirth, address: $address}';
  }
}
