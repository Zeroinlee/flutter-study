import 'package:firebase_login/pages/anonymous_sign_in_page.dart';
import 'package:firebase_login/pages/google_auth_page.dart';
import 'package:firebase_login/pages/phone_auth_page.dart';
import 'package:firebase_login/pages/rest_password_page';
import 'package:firebase_login/pages/sign_out_page.dart';
import 'package:firebase_login/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GoogleAuthPage(),
                      ));
                },
                child: const Text('Google Auth Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ));
                },
                child: const Text('Sign Up Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ));
                },
                child: const Text('Email/Password Sign In Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignOutPage(),
                      ));
                },
                child: const Text('Sign Out Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPasswordPage(),
                      ));
                },
                child: const Text('Reset Password Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhoneAuthPage(),
                      ));
                },
                child: const Text('Phone Auth Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AnonymousSignInPage(),
                      ));
                },
                child: const Text('Anonymous Sign In Page')),
          ],
        ),
      ),
    );
  }
}
