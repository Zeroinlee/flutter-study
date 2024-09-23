import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDatabasePage extends StatefulWidget {
  @override
  _UserDatabasePageState createState() => _UserDatabasePageState();
}

class _UserDatabasePageState extends State<UserDatabasePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;

  Future<void> _saveUserData() async {
    final name = _nameController.text;
    final email = _emailController.text;

    if (name.isNotEmpty && email.isNotEmpty) {
      try {
        // 사용자 정보를 Firestore에 저장하세요.
        await _firestore.collection('users').add({
          'name': name,
          'email': email,
          'createdAt': Timestamp.now(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User information saved successfully!')),
        );

        _nameController.clear();
        _emailController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save user information: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both name and email.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Database'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveUserData,
                  child: Text('Save User Data'),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No user data available.'));
                } else {
                  final users = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index].data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text(user['name'] ?? 'No Name'),
                        subtitle: Text(user['email'] ?? 'No Email'),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
