import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
/*
class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final HttpsCallable _registerCallable =
      FirebaseFunctions.instance.httpsCallable('registerUser');
  final HttpsCallable _loginCallable =
      FirebaseFunctions.instance.httpsCallable('loginUser');

  Future<void> _register() async {
    try {
      // Cloud Functions을 사용해 사용자를 등록하세요.

      print('User registered: ${response.data}');
    } catch (e) {
      print('Failed to register: $e');
    }
  }

  Future<void> _login() async {
    try {
      // Cloud Functions을 사용해 로그인 기능을 구현하세요.

      print('User logged in: ${response.data}');
    } catch (e) {
      print('Failed to login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Authentication')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Register'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}*/
