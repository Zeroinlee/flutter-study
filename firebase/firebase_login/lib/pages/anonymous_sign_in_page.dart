import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AnonymousSignInPage extends StatefulWidget {
  const AnonymousSignInPage({super.key});

  @override
  _AnonymousSignInPageState createState() => _AnonymousSignInPageState();
}

class _AnonymousSignInPageState extends State<AnonymousSignInPage> {
  String? _userId;

  Future<void> _signInAnonymously() async {
    // Firebase 인증 메서드를 사용하여 익명 로그인을 구현하세요.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase 익명 로그인'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('익명 로그인'),
            ),
            const SizedBox(height: 20),
            if (_userId != null) Text('로그인 성공! 사용자 ID: $_userId'),
          ],
        ),
      ),
    );
  }
}
