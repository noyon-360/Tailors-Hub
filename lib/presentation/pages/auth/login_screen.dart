import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tailors_hub/core/themes.dart';
import 'package:tailors_hub/presentation/bloc/auth_screen_switch/auth_switch_cubit.dart';
import 'package:tailors_hub/presentation/widgets/custom_textfield.dart';
import 'package:tailors_hub/presentation/widgets/google_button.dart';

class LoginScreen extends StatefulWidget {
  final bool isTailor;
  const LoginScreen({super.key, required this.isTailor});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Form Key for Validation
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print("Login Screen | Role : ${widget.isTailor}");
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title
                Text(
                  "Login as ${widget.isTailor ? "Tailor" : "Customer"}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),


                // Email Field
                CustomTextField(
                  controller: _emailController,
                  labelText: "Email",
                  prefixIcon: Icons.email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Password Field
                CustomTextField(
                  controller: _passwordController,
                  labelText: "Password",
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Register Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform registration logic
                      print('Login successful');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),

                // Login Prompt
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        context.read<AuthSwitchCubit>().switchRegisterScreen(widget.isTailor);
                      },
                      child: const Text(
                        'Register',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Or Divider
                const Row(
                  children: [
                    Expanded(child: Divider(color: AppThemes.coral,)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("OR"),
                    ),
                    Expanded(child: Divider(color: AppThemes.coral,)),
                  ],
                ),
                const SizedBox(height: 16),

                // Google Sign-In Button
                GoogleButton(onPressed: () {})
                // OutlinedButton.icon(
                //   onPressed: () {
                //     // Handle Google Sign-In
                //   },
                //   icon: Image.asset(
                //     'assets/icons/google.png',
                //     height: 20,
                //     width: 20,
                //   ),
                //   label: Text(
                //     'Sign up with Google',
                //     style: TextStyle(color: Color(0xFF333333)),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
