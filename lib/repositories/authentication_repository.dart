import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bcrypt/bcrypt.dart';
import 'dart:math';

class AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register Tailor
  Future<User?> registerTailor(
    String name,
    String shopName,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Store additional user data
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        "name": name,
        "shop_name": shopName,
        "email": email,
        "role": "tailor",
      });

      return userCredential.user;
    } catch (e) {
      throw Exception("Registration failed: $e");
    }
  }

  // Register Customer
  Future<User?> registerCustomer(
    String name,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        "name": name,
        "email": email,
        "role": "customer",
      });

      return userCredential.user;
    } catch (e) {
      throw Exception("Registration failed: $e");
    }
  }

  // Login
  Future<User?> login(String email, String password, String role) async {
    try {
      // Step 1: Check if the email is exists in Firebase
      QuerySnapshot userQuery =
          await _firestore
              .collection('users')
              .where('email', isEqualTo: email)
              .limit(1)
              .get();

      var userData = userQuery.docs.first.data() as Map<String, dynamic>;
      if (userQuery.docs.isEmpty || userData['role'] != role) {
        throw Exception("User with this email does not exist.");
      }

      // // Step 2: Check if the role matches
      // if (userData['role'] != role){
      //   throw Exception("User with this email does not exist.");
      // }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
  }

  // Generate OTP
  String generateOTP() {
    Random random = Random();
    return (100000 + random.nextInt(900000)).toString(); // 6-digit OTP
  }

  // Store OTP in Firestore
  Future<void> storeOTP(String email, String otp) async {
    await _firestore.collection('otp_verifications').doc(email).set({
      "otp": otp,
      "timestamp": FieldValue.serverTimestamp(),
    });
  }

  // Verify OTP
  Future<bool> verifyOTP(String email, String enteredOtp) async {
    final doc =
        await _firestore.collection('otp_verifications').doc(email).get();
    if (!doc.exists) return false;

    final storedOtp = doc.data()?["otp"];
    return enteredOtp == storedOtp;
  }

  // Reset Password
  Future<void> resetPassword(String email, String newPassword) async {
    try {
      String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

      // Get user UID
      final querySnapshot =
          await _firestore
              .collection('users')
              .where('email', isEqualTo: email)
              .limit(1)
              .get();

      if (querySnapshot.docs.isEmpty) throw Exception("User not found");

      final userDoc = querySnapshot.docs.first;
      final uid = userDoc.id;

      // Update password in Firebase Auth
      User? user = _auth.currentUser;
      if (user != null && user.email == email) {
        await user.updatePassword(newPassword);
      } else {
        throw Exception("User not logged in");
      }

      // Update password in Firestore
      await _firestore.collection('users').doc(uid).update({
        'password': hashedPassword,
      });
    } catch (e) {
      throw Exception("Password reset failed: $e");
    }
  }
}
