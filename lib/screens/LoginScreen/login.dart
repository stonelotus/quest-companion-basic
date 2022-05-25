// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:quest_companion/screens/LobbyScreen/lobby.dart';
import 'package:quest_companion/screens/LoginScreen/components/background.dart';
import 'package:quest_companion/services/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "Quest\nCompanion",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            // Container(
            //   alignment: Alignment.centerRight,
            //   margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            //   child: Text(
            //     "Forgot your password?",
            //     style: TextStyle(fontSize: 12, color: Color(0XFF2661FA)),
            //   ),
            // ),
            SizedBox(height: size.height * 0.02),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Positioned(
                top: 0,
                right: 0,
                child:
                    Image.asset("assets/images/sandra.png", width: size.width),
              ),
            ),
            SizedBox(height: size.height * 0.0),

            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RaisedButton(
                onPressed: () {
                  AuthService().signInWithGoogle().then((value) => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LobbyScreen()))
                      });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 255, 136, 34),
                        Color.fromARGB(255, 255, 177, 41)
                      ])),
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    "LOGIN",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
