import 'package:flutter/material.dart';
import 'package:mike_project/authentication/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
      url: "https://ddzmhthgokdcdimeovae.supabase.co",
      anonKey:
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRkem1odGhnb2tkY2RpbWVvdmFlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQxMTIyOTIsImV4cCI6MjA1OTY4ODI5Mn0.i8g6DfgzwyMTXvFTZT47cDSZEcSZcfc0zmsPgB0eqd0");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home: AuthPass(),
    );
  }
}
