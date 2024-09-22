import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListDocumentPage extends StatefulWidget {
  @override
  _ListDocumentPageState createState() => _ListDocumentPageState();
}

class _ListDocumentPageState extends State<ListDocumentPage> {
  final _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> _fetchDocument() {
    try {
      // 문서 읽기를 구현하세요.
      return _firestore.collection('documents').snapshots();
    } catch (e) {
      throw Exception('Failed to load document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Document from Firestore'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _fetchDocument(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Document does not exist.'));
          } else {
            final documents = snapshot.data!.docs;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final doc = documents[index].data() as Map<String, dynamic>;
                return ListTile(
                  title: Text(doc['title'] ?? 'No Title'),
                  subtitle: Text(doc['content'] ?? 'No content'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
