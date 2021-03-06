import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('MainPage'),
      ),
      drawer: const Drawer(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Signed In as ${user?.email}'),
          MaterialButton(
            color: Colors.deepOrange.shade400,
            onPressed: FirebaseAuth.instance.signOut,
            child: const Text(
              'SignOut',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      )),
    );
  }
}
