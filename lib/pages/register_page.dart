import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //* Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //* SignUp Method
  Future signUp() async {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                  'Hello There',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Register Below',
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
                //* Confirm Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    obscureText: true,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ), // OutlineInputBorder
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(12),
                      ), // OutlineInputBorder
                      hintText: 'Confirm Password',
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
                    onTap: signUp,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            'Sign Up',
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
                    const Text('Have an account? '),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        'Login',
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
