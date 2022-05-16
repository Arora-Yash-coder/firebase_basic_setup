import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //* Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //* Sign In Method
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //*Logo
                const Icon(
                  Icons.android,
                  size: 48,
                ),
                //* Heading
                Text(
                  'Hello Again!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 128,
                ),

                //* Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ), // OutlineInputBorder
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(12),
                      ), // OutlineInputBorder
                      hintText: 'Email',
                      fillColor: Colors.grey[100],
                      filled: true,
                    ), // InputDecoration
                  ), // TextField
                ),
                const SizedBox(
                  height: 10,
                ),

                //* Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ), // OutlineInputBorder
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(12),
                      ), // OutlineInputBorder
                      hintText: 'Password',
                      fillColor: Colors.grey[100],
                      filled: true,
                    ), // InputDecoration
                  ), // TextField
                ),
                const SizedBox(
                  height: 10,
                ),

                //* SignIn
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //* Create Account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member? '),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: const Text(
                        'Register Now',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
