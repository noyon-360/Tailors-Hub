import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tailors_hub/config/route/routes_name.dart';
import 'package:tailors_hub/core/themes.dart';
import 'package:tailors_hub/model/customer_model.dart';
import 'package:tailors_hub/model/tailor_model.dart';
import 'package:tailors_hub/presentation/bloc/Theme%20Management/them_state.dart';
import 'package:tailors_hub/presentation/bloc/auth_screen_switch/auth_switch_cubit.dart';
import 'package:tailors_hub/presentation/bloc/authentication/auth_bloc.dart';
import 'package:tailors_hub/presentation/widgets/custom_textfield.dart';
import 'package:tailors_hub/presentation/widgets/google_button.dart';

class RegisterScreen extends StatefulWidget {
  final bool isTailor;

  const RegisterScreen({super.key, required this.isTailor});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();

  // Form Key for Validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("Register Screen | Role : ${widget.isTailor}");
    return Scaffold(
      appBar: AppBar(title: const Text('Register'), centerTitle: true),
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Register Successful")));
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.home,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Title
                    Text(
                      "Register as ${widget.isTailor ? "Tailor" : "Customer"}",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // Name Field
                    CustomTextField(
                      controller: _nameController,
                      labelText: "Name",
                      prefixIcon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Shop Name Field (Only for Tailors)
                    if (widget.isTailor)
                      Column(
                        children: [
                          CustomTextField(
                            controller: _shopNameController,
                            labelText: "Shop Name",
                            prefixIcon: Icons.store,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your shop name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),

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
                          if (widget.isTailor) {
                            // final tailor = TailorModel(
                            //   name: _nameController.text,
                            //   shopName: _shopNameController.text,
                            //   email: _emailController.text,
                            //   password: _passwordController.text,
                            //   role: "tailor",
                            // );
                            context.read<AuthenticationBloc>().add(
                              TailorRegisterEvent(
                                name: _nameController.text,
                                shopName: _shopNameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                          } else {
                            // final customer = CustomerModel(
                            //   name: _nameController.text,
                            //   email: _emailController.text,
                            //   password: _passwordController.text,
                            //   role: "customer",
                            // );
                            context.read<AuthenticationBloc>().add(
                              CustomerRegisterEvent(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Login Prompt
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            context.read<AuthSwitchCubit>().switchLoginScreen(
                              widget.isTailor,
                            );
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Or Divider
                    const Row(
                      children: [
                        Expanded(child: Divider(color: AppThemes.coral)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text("OR"),
                        ),
                        Expanded(child: Divider(color: AppThemes.coral)),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Google Sign-In Button
                    GoogleButton(
                      onPressed: () {
                        print("Google Button");
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
