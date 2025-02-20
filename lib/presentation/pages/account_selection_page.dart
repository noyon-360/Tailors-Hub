import 'package:flutter/material.dart';
import 'package:tailors_hub/config/route/routes_name.dart';

class AccountSelectionPage extends StatelessWidget {
  const AccountSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Join TailorsHub')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(
                //   'Join TailorsHub',
                //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                // ),
                SizedBox(height: 20),
                Text(
                  'Choose Your Role',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'Are you here to create custom clothing or provide tailoring services?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 40),

                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isWide = constraints.maxWidth > 600;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: _buildAccountCard(
                            icon: Icons.work,
                            title: 'Tailor',
                            subtitle: 'Provide tailoring services and grow your business.',
                            color: Colors.orange,
                            onTap: () {

                              Navigator.pushNamed(
                                context,
                                RouteNames.authScreenController,
                                arguments: true
                              );
                            },
                          ),
                        ),
                        SizedBox(width: isWide ? 20 : 10),
                        Expanded(
                          child: _buildAccountCard(
                            icon: Icons.person,
                            title: 'Style Creator',
                            subtitle: 'Get custom clothing made for your unique style.',
                            color: Colors.indigo,
                            onTap: () {
                              Navigator.pushNamed(
                                  context,
                                  RouteNames.authScreenController,
                                  arguments: false
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
