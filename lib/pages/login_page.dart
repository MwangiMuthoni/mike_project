import 'package:flutter/material.dart';
import 'package:mike_project/pages/register_page.dart';

import '../authentication/auth_service.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      await authService.signInWithEmailPassword(email, password);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Text(
              "LOGIN",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

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

            // Login Button
            ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Login',
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
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              child: const Text(
                "Don't have an account?",
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
