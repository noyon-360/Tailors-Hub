part of 'auth_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// Register Tailor
class TailorRegisterEvent extends AuthenticationEvent {
  final String name;
  final String shopName;
  final String email;
  final String password;

  TailorRegisterEvent({required this.name, required this.shopName, required this.email, required this.password});

  @override
  List<Object> get props => [name, shopName, email, password];
}

// Register Customer
class CustomerRegisterEvent extends AuthenticationEvent {
  final String name;
  final String email;
  final String password;

  CustomerRegisterEvent({required this.name, required this.email, required this.password});

  @override
  List<Object> get props => [name, email, password];
}

// Login Event
class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final String role;

  LoginEvent({required this.email, required  this.password, required this.role});

  @override
  List<Object> get props => [email, password, role];
}

// Generate OTP Event
class GenerateOTPEvent extends AuthenticationEvent {
  final String email;

  GenerateOTPEvent(this.email);

  @override
  List<Object> get props => [email];
}

// Verify OTP Event
class VerifyOTPEvent extends AuthenticationEvent {
  final String email;
  final String enteredOtp;

  VerifyOTPEvent(this.email, this.enteredOtp);

  @override
  List<Object> get props => [email, enteredOtp];
}

// Reset Password Event
class ResetPasswordEvent extends AuthenticationEvent {
  final String email;
  final String newPassword;

  ResetPasswordEvent(this.email, this.newPassword);

  @override
  List<Object> get props => [email, newPassword];
}