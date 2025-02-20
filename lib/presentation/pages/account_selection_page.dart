import 'package:flutter/material.dart';
import 'package:tailors_hub/config/route/routes_name.dart';
import 'package:tailors_hub/presentation/widgets/account_type_card.dart';

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

                OrientationBuilder(
                  builder: (context, orientation) {
                    bool isLandscape =
                        MediaQuery.of(context).orientation ==
                        Orientation.landscape;
                    print(isLandscape);
                    return isLandscape
                        ? Row(
                          children: [
                            Expanded(
                              child: AccountTypeCard(
                                icon: Icons.work,
                                title: 'Tailor',
                                subtitle:
                                    'Provide tailoring services and grow your business.',
                                color: Colors.orange,
                                // Coral color
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteNames.tailorLogin,
                                  );
                                },
                              ),
                            ),

                            SizedBox(width: 20),

                            // Style Creator Option
                            Expanded(
                              child: AccountTypeCard(
                                icon: Icons.person,
                                title: 'Style Creator',
                                subtitle:
                                    'Get custom clothing made for your unique style.',
                                color: Colors.indigo,
                                // Navy blue
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/customer_register',
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                        : Column(
                          children: [
                            AccountTypeCard(
                              icon: Icons.work,
                              title: 'Tailor',
                              subtitle:
                                  'Provide tailoring services and grow your business.',
                              color: Colors.orange,
                              // Coral color
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteNames.tailorLogin,
                                );
                              },
                            ),

                            SizedBox(height: 20),

                            // Style Creator Option
                            AccountTypeCard(
                              icon: Icons.person,
                              title: 'Style Creator',
                              subtitle:
                                  'Get custom clothing made for your unique style.',
                              color: Colors.indigo,
                              // Navy blue
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/customer_register',
                                );
                              },
                            ),
                          ],
                        );
                  },
                ),
                // Tailor Option
                // AccountTypeCard(
                //   icon: Icons.work,
                //   title: 'Tailor',
                //   subtitle: 'Provide tailoring services and grow your business.',
                //   color: Colors.orange, // Coral color
                //   onTap: () {
                //     Navigator.pushNamed(context, '/tailor_register');
                //   },
                // ),
                //
                // SizedBox(height: 20),
                //
                // // Style Creator Option
                // AccountTypeCard(
                //   icon: Icons.person,
                //   title: 'Style Creator',
                //   subtitle: 'Get custom clothing made for your unique style.',
                //   color: Colors.indigo, // Navy blue
                //   onTap: () {
                //     Navigator.pushNamed(context, '/customer_register');
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
