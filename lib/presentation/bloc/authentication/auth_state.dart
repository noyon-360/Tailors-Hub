part of 'auth_bloc.dart';

abstract class AuthenticationState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// Initial state
class AuthInitial extends AuthenticationState {}

// Loading state (shows a loader when processing)
class AuthLoading extends AuthenticationState {}

// Success state when authentication is successful
class AuthSuccess extends AuthenticationState {
  final User? user;

  AuthSuccess(this.user);

  @override
  List<Object> get props => [user!];
}

// Failure state (shows error message)
class AuthFailure extends AuthenticationState {
  final String message;

  AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}

// OTP Sent State
class OTPSentState extends AuthenticationState {
  final String email;

  OTPSentState(this.email);

  @override
  List<Object> get props => [email];
}

// OTP Verified State
class OTPVerifiedState extends AuthenticationState {}

// Password Reset Successful
class PasswordResetSuccess extends AuthenticationState {}