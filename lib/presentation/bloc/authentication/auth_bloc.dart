import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tailors_hub/model/customer_model.dart';
import 'package:tailors_hub/model/tailor_model.dart';
import 'package:tailors_hub/repositories/authentication_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

  AuthenticationBloc(this.authenticationRepository) : super(AuthInitial()) {
    // Tailor Registration
    on<TailorRegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authenticationRepository.registerTailor(
          event.name,
          event.shopName,
          event.email,
          event.password,
        );
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    // Customer Registration
    on<CustomerRegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authenticationRepository.registerCustomer(
          event.name,
          event.email,
          event.password,
        );
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    // Login
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      try {
        //check the role of the provided email, if (event.role and the role is match then go login, else show email is not exist or any user-friendly message

        final user = await authenticationRepository.login(
          event.email,
          event.password,
          event.role,
        );
        print(user);

        if (user != null) {
          emit(AuthSuccess(user));
        }
        else {
          emit(AuthFailure("Authentication failed. Please try again."));
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
