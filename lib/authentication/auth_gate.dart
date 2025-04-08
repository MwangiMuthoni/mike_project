import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
class AuthPass extends StatelessWidget {
  const AuthPass({super.key});

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        //Build appropriate page based on auth state
        builder: (context, snapshot) {
          // loading..
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          // check if there is a valid session currently
          final session = snapshot.hasData ? snapshot.data!.session :null;
          if(session != null){
            return HomePage();

          }
          else {
            return LoginPage();
          }
        }
    );
  }
}
