import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailors_hub/config/route/package_path.dart';
import 'package:tailors_hub/config/route/routes_name.dart';
import 'package:tailors_hub/core/secure_key_content/secure_key.dart';
import 'package:tailors_hub/core/themes.dart';
import 'package:tailors_hub/presentation/bloc/Theme%20Management/them_state.dart';
import 'package:tailors_hub/presentation/pages/home.dart';
import 'package:tailors_hub/presentation/widgets/onboarding_page_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      // 'image': 'assets/onboarding1.png',
      'title': 'Find Your Perfect Tailor',
      'description': 'Discover skilled tailors near you with just a few taps.',
    },
    {
      // 'image': 'assets/onboarding2.png',
      'title': 'Accurate Measurements',
      'description':
          'Use our AR tools to get precise measurements for a perfect fit.',
    },
    {
      // 'image': 'assets/onboarding3.png',
      'title': 'Track Your Order',
      'description':
          'Stay updated on your order status from stitching to delivery.',
    },
  ];

  void completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SecureKey.isFirstTimeKey, false);

    Navigator.pushReplacementNamed(context, RouteNames.home);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                  // image: onboardingData[index]['image']!,
                  title: onboardingData[index]['title']!,
                  description: onboardingData[index]['description']!,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: completeOnboarding,
                child: Text('Skip', style: TextStyle(color: AppThemes.coral)),
              ),
              Row(
                children: List.generate(onboardingData.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentPage == index ? AppThemes.coral : Colors.grey,
                    ),
                  );
                }),
              ),
              TextButton(
                onPressed: () {
                  if (_currentPage == onboardingData.length - 1) {
                    completeOnboarding();
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
                child: Text(
                  _currentPage == onboardingData.length - 1
                      ? 'Get Started'
                      : 'Next',
                  style: TextStyle(color: AppThemes.coral),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
