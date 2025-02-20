import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  const GoogleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Image.asset('assets/icons/google.png', height: 20, width: 20),
      label: Text(
        'Sign up with Google',
        style: TextStyle(color: Color(0xFF333333)),
      ),
    );
  }
}
