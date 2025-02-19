import 'package:flutter/material.dart';
import 'package:tailors_hub/core/themes.dart';
import 'package:tailors_hub/presentation/bloc/Theme%20Management/them_state.dart';

class OnboardingPage extends StatelessWidget {
  // final String image;
  final String title;
  final String description;

  const OnboardingPage({super.key,
    // required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image.asset(image, width: 250, height: 250),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppThemes.coral
            // color: AppThemes.primaryColor,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
