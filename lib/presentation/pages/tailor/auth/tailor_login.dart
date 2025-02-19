import 'package:flutter/material.dart';

class TailorLogin extends StatefulWidget {
  const TailorLogin({super.key});

  @override
  State<TailorLogin> createState() => _TailorLoginState();
}

class _TailorLoginState extends State<TailorLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Tailor Login"),),
    );
  }
}
