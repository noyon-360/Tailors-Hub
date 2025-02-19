import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailors_hub/config/route/routes_name.dart';
import 'package:tailors_hub/core/secure_key_content/secure_key.dart';
import 'package:tailors_hub/core/themes.dart';
import 'package:tailors_hub/presentation/bloc/Theme%20Management/them_cubit.dart';
import 'package:tailors_hub/presentation/widgets/custom_textfield.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [Icon(Icons.info)],
      
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Home", style: Theme.of(context).textTheme.bodyLarge)),

          // Email TextField
          // TextField(
          //   decoration: InputDecoration(
          //     labelText: 'Email',
          //     prefixIcon: Icon(Icons.email, color: Theme.of(context).iconTheme.color),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //   ),
          //   keyboardType: TextInputType.emailAddress,
          // ),

          CustomTextField(labelText: "Email", prefixIcon: Icons.email_outlined,),

          SizedBox(height: 20,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.,
              children: [
                ElevatedButton(
                  onPressed: () {
                    themeCubit.switchToLightTheme();
                  },
                  child: Text("Light"),
                ),
                ElevatedButton(
                  onPressed: () {
                    themeCubit.switchToDarkTheme();
                  },
                  child: Text("Dark"),
                ),
                ElevatedButton(
                  onPressed: () {
                    themeCubit.switchToSystemTheme();
                  },
                  child: Text("System"),
                ),
              ],
            ),
          ),

          ElevatedButton(onPressed: (){
            Navigator.pushReplacementNamed(context, RouteNames.tailorLogin);
          }, child: Text("Tailor Login")),

          ElevatedButton(onPressed: () async{
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.remove(SecureKey.isFirstTimeKey);
          }, child: Text("Delete First Time Screen"))

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person" ),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home" ),
      ]),
    );
  }
}
