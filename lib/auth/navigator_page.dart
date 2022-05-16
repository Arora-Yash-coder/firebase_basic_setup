import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_basic_setup/auth/auth_page.dart';
import 'package:firebase_basic_setup/pages/home_page.dart';
import 'package:flutter/material.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
