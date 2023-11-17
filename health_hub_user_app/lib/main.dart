import 'package:flutter/material.dart';
import 'package:health_hub_user_app/homepage.dart';

// Colors
const Color primaryColor = Color.fromRGBO(121, 198, 152, 1);
const Color secondaryColor = Color.fromRGBO(69, 160, 150, 1);
const Color primaryTextColor = Color.fromRGBO(49, 48, 54, 1);
const Color secondaryTextColor = Color.fromRGBO(116, 115, 120, 1);
const Color cardBackgroundColor = Color.fromARGB(255, 239, 240, 244);

// Check if user is logged in
Future<Widget> pageChooser() async {
  return HomePage();
}

// Variables
var page;

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  // Check if user is logged in and choose the page
  page = await pageChooser();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthHub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      home: page,
    );
  }
}
