import 'package:flutter/material.dart';

class TailorDashboard extends StatefulWidget {
  const TailorDashboard({super.key});

  @override
  State<TailorDashboard> createState() => _TailorDashboardState();
}

class _TailorDashboardState extends State<TailorDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Tailor Dashboard"),),
    );
  }
}
