import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthPage extends StatefulWidget {
  const GoogleAuthPage({super.key});

  @override
  _GoogleAuthPageState createState() => _GoogleAuthPageState();
}

class _GoogleAuthPageState extends State<GoogleAuthPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? _user;

  @override
  void initState() {
    super.initState();

    // Firebase 인증 상태 변경을 감지하여 _user 상태를 업데이트합니다.
    _auth.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }

  Future<void> _signInWithGoogle() async {
    try {
      // 사용자가 Google 계정을 선택하고 로그인하도록 합니다.
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // 사용자가 로그인하지 않고 프로세스를 취소한 경우
      if (googleUser == null) {
        return;
      }

      // GoogleSignInAuthentication 객체를 통해 인증 정보를 가져옵니다.
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Google 인증 정보를 사용하여 Firebase에 로그인합니다.
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Firebase에 로그인합니다.
      await _auth.signInWithCredential(credential);
    } catch (e) {
      // 오류 메시지를 출력합니다.
      print('Error signing in with Google: $e');

      // 사용자에게 오류 메시지를 표시합니다.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in with Google: $e')),
      );
    }
  }

  Future<void> _signOut() async {
    // 로그아웃 기능을 구현하세요.
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Authentication'),
      ),
      body: Center(
        child: _user == null
            ? ElevatedButton(
                onPressed: _signInWithGoogle,
                child: const Text('Sign in with Google'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Signed in as ${_user!.displayName}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _signOut,
                    child: const Text('Sign out'),
                  ),
                ],
              ),
      ),
    );
  }
}
