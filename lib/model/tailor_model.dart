import 'package:equatable/equatable.dart';

class TailorModel extends Equatable {
  final String name;
  final String shopName;
  final String email;
  final String password;
  final String role;

  const TailorModel({
    required this.name,
    required this.shopName,
    required this.email,
    required this.password,
    required this.role
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'shop_name': shopName,
      'email': email,
      'password': password,
      'role': role
    };
  }

  // Create object from JSON
  factory TailorModel.fromJson(Map<String, dynamic> json) {
    return TailorModel(
      name: json['name'],
      shopName: json['shop_name'],
      email: json['email'],
      password: json['password'],
      role: json['role']
    );
  }

  @override
  List<Object?> get props => [name, shopName, email, password, role];
}
