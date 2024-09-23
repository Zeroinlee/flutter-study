import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOutPage extends StatefulWidget {
  const SignOutPage({super.key});

  @override
  _SignOutPageState createState() => _SignOutPageState();
}

class _SignOutPageState extends State<SignOutPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    // Firebase 인증 상태 변경을 감지하여 _user 상태를 업데이트합니다.
    _auth.authStateChanges().listen((User? user) {
      setState(() {});
    });
  }

  Future<void> _signOut() async {
    try {
      // Firebase Authentication을 사용하여 로그아웃을 구현하세요.
      await _auth.signOut();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully signed out!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign out failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Auth Sign Out'),
      ),
      body: Center(
        child: user == null
            ? const Text('No user signed in')
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Signed in as ${user.email}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _signOut,
                    child: const Text('Sign Out'),
                  ),
                ],
              ),
      ),
    );
  }
}
