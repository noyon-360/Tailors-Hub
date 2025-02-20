import 'package:flutter/material.dart';
import 'package:tailors_hub/core/themes.dart';

class TailorsHubDrawer extends StatelessWidget {
  final bool isTailor;
  const TailorsHubDrawer({super.key, required this.isTailor});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.indigo), // Navy blue for brand consistency
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'StitchLink',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Bridging Tailors & Customers, Stitch by Stitch.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Conditional Rendering Based on User Type
          if (!isTailor) ...[
            // Customer Section
            ListTile(
              leading: Icon(Icons.person, color: Colors.indigo),
              title: Text('Profile'),
              onTap: () {
                // Navigate to Profile Screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.straighten, color: Colors.indigo),
              title: Text('AR Measurements'),
              onTap: () {
                // Navigate to AR Measurement Screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.track_changes, color: Colors.indigo),
              title: Text('Order Tracking'),
              onTap: () {
                // Navigate to Order Tracking Screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.payment, color: Colors.indigo),
              title: Text('Payment History'),
              onTap: () {
                // Navigate to Payment History Screen
                Navigator.pop(context);
              },
            ),
          ] else ...[
            // Tailor Section
            ListTile(
              leading: Icon(Icons.work, color: Colors.orange),
              title: Text('Manage Orders'),
              onTap: () {
                // Navigate to Tailor Order Management Screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.visibility, color: Colors.orange),
              title: Text('Boost Visibility'),
              onTap: () {
                // Navigate to Tailor Visibility Tools
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics, color: Colors.orange),
              title: Text('Workload & Pricing'),
              onTap: () {
                // Navigate to Workload & Pricing Tools
                Navigator.pop(context);
              },
            ),
          ],

          Divider(),

          // Platform Section (Common for Both)
          ListTile(
            leading: Icon(Icons.help, color: Colors.grey),
            title: Text('Support'),
            onTap: () {
              // Navigate to Support Screen
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.grey),
            title: Text('Settings'),
            onTap: () {
              // Navigate to Settings Screen
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.grey),
            title: Text('Logout'),
            onTap: () {
              // Handle Logout
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
