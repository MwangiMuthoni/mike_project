import 'package:flutter/material.dart';
import 'package:mike_project/pages/login_page.dart';

import '../authentication/auth_service.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final authService = AuthService();
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  //sign up button pressed
  void signUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
//check that passwords match
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords dont match'),
        ),
      );
    }
    // attempt login..
    try {
      await authService.signUpWithEmailPassword(email, password);
      //pop this register page
      Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error : $e")));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
backgroundColor: Colors.white60,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [



            // Image between title and textfields
            Image.asset(
              'assets/img/logoauth.png',
              height: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 30),

            // Email TextField
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Password TextField
            TextField(
              controller: _passwordController,
              // obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: ' Confirm Password',
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Adjust the radius as you like
                  borderSide: BorderSide.none, // Removes the default border
                ),
              ),
              //obscureText: true,
            ),
            SizedBox(height:10 ,),
            // Login Button
            ElevatedButton(
              onPressed: signUp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Sign up link
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage(),),
                );
              },
              child: const Text(
                "Already have an account?",
                style: TextStyle(
                  color: Colors.black87,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
