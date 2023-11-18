import 'package:flutter/material.dart';
import 'package:health_hub_user_app/utils/custom_prescription_info_card.dart';
import 'package:health_hub_user_app/utils/my_submit_button.dart';
import 'main.dart';
import 'utils/custom_pill_day_card.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {
    //BACKEND
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cardBackgroundColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 28),
                //logo
                const Icon(
                  Icons.lock,
                  color: secondaryColor,
                  size: 100,
                ),

                const SizedBox(height: 28),

                //welcome back
                const Text(
                  'Health Hub User Portal',
                  style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                  ),
                ),

                const SizedBox(height: 30),

                // username textfield
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                  child: Material(
                    color: Colors.white,
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(21.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: TextFormField(
                        obscureText: false,
                        controller: usernameController,
                        decoration: const InputDecoration(
                          labelText: "Introdu CNP-ul",
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nu poți lăsa acest spațiu liber!';
                          } else if (value.length != 13) {
                            return 'CNP-ul trebuie să conțină exact 13 caractere!';
                          }
                          return null;
                        },
                        style: const TextStyle(fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                // password textfield
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                  child: Material(
                    color: Colors.white,
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(21.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: "Introdu parola",
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                        ),

                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nu poți lăsa acest spațiu liber!';
                          } else if (value.length < 6) {
                            return 'Parola trebuie să conțină cel puțin 6 caractere!';
                          }
                          return null;
                        },
                        style: const TextStyle(fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                //forgot password?

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: primaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                MyButton(
                  onTap: signUserIn,
                ),

                //login button
              ],
            ),
          ),
        ));
  }
}
