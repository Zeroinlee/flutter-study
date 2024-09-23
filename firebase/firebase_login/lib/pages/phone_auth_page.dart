import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuthPage extends StatefulWidget {
  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final _phoneController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  Future<void> _verifyPhoneNumber() async {
    final phoneNumber = _phoneController.text;

    if (phoneNumber.isNotEmpty) {
      try {
        await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            // 자동으로 인증이 완료된 경우, FirebaseAuth에 로그인을 구현하세요.
          },
          verificationFailed: (FirebaseAuthException e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Verification failed: $e')),
            );
          },
          codeSent: (String verificationId, int? resendToken) {
            showDialog(
              context: context,
              builder: (context) => VerificationDialog(
                verificationId: verificationId,
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Code retrieval timeout')),
            );
          },
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to verify phone number: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your phone number.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Number Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Verify Phone Number'),
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationDialog extends StatefulWidget {
  final String verificationId;

  VerificationDialog({required this.verificationId});

  @override
  _VerificationDialogState createState() => _VerificationDialogState();
}

class _VerificationDialogState extends State<VerificationDialog> {
  final _smsCodeController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  Future<void> _signInWithSMSCode() async {
    final smsCode = _smsCodeController.text;

    if (smsCode.isNotEmpty) {
      try {
        final credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId,
          smsCode: smsCode,
        );
        await _auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Phone number verified successfully')),
        );
        Navigator.of(context).pop();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign in with SMS code: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter the SMS code.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter SMS Code'),
      content: TextField(
        controller: _smsCodeController,
        decoration: InputDecoration(labelText: 'SMS Code'),
        keyboardType: TextInputType.number,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _signInWithSMSCode,
          child: Text('Verify'),
        ),
      ],
    );
  }
}
