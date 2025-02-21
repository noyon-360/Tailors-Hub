import 'package:equatable/equatable.dart';

class CustomerModel extends Equatable {
  final String name;
  final String email;
  final String password;
  final String role;

  const CustomerModel({
    required this.name,
    required this.email,
    required this.password,
    required this.role

  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      'role': role
    };
  }

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      role: json['role']
    );
  }

  @override
  List<Object?> get props => [name, email, password, role];
}
