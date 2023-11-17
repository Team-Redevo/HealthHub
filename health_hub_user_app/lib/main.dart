import 'package:flutter/material.dart';
import 'package:health_hub_user_app/homepage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:health_hub_user_app/prescription_page.dart';

// Colors
const Color primaryColor = Color.fromRGBO(121, 198, 152, 1);
const Color secondaryColor = Color.fromRGBO(69, 160, 150, 1);
const Color primaryTextColor = Color.fromRGBO(49, 48, 54, 1);
const Color secondaryTextColor = Color.fromRGBO(116, 115, 120, 1);
const Color cardBackgroundColor = Color.fromARGB(255, 239, 240, 244);

// // Check if user is logged in
// Future<Widget> pageChooser() async {
//   return HomePage();
// }

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  // Check if user is logged in and choose the page
  int page = 0;

  runApp(App(pageId: page));
}

class MainPage extends StatefulWidget {
  MainPage();

  @override
  // ignore: no_logic_in_create_state
  State<MainPage> createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MainPage> {
  // Variables
  int selectedIndex = 0;

  _MyAppPageState();

  // List of pages
  List<Widget> _pages = [];

  // Function to change the page
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void initState() {
    super.initState();

    // Initialize the list of pages here with userData
    _pages = [
      HomePage(),
      PrescriptionPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,

        // The body of the page
        body: _pages[selectedIndex],

        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(7.5),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: primaryTextColor.withAlpha(50),
                  spreadRadius: 0.25,
                  blurRadius: 20,
                )
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(23), topRight: Radius.circular(23))),
          child: GNav(
            padding: EdgeInsets.all(15),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            gap: 5,
            duration: const Duration(milliseconds: 400),
            color: primaryTextColor,
            activeColor: primaryColor,
            tabBackgroundColor: primaryColor.withAlpha(65),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              GButton(
                icon: Icons.receipt_long,
                text: 'Prescriptions',
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              GButton(
                icon: Icons.biotech,
                text: 'Lab Results',
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              GButton(
                icon: Icons.account_circle,
                text: 'Profile',
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            ],
            selectedIndex: selectedIndex,
            onTabChange: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

class App extends StatelessWidget {
  final int pageId;

  const App({required this.pageId});

  @override
  Widget build(BuildContext context) {
    Widget page = MainPage();

    if (pageId == 0) {
      page = MainPage();
    }

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
