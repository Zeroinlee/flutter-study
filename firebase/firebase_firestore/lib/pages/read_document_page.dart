import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReadDocumentPage extends StatefulWidget {
  @override
  _ReadDocumentPageState createState() => _ReadDocumentPageState();
}

class _ReadDocumentPageState extends State<ReadDocumentPage> {
  final _firestore = FirebaseFirestore.instance;
  final String _documentId = 'my_document_id'; // 최근 documentId 가져오기

  Future<DocumentSnapshot> _fetchDocument() async {
    try {
      // 문서 읽기를 구현하세요.
      return await _firestore.collection('documents').doc(_documentId).get();
    } catch (e) {
      throw Exception('Failed to load document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Document from Firestore'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _fetchDocument(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Document does not exist.'));
          } else {
            final data = snapshot.data!.data() as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Title: ${data['title'] ?? 'No Title'}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Content: ${data['content'] ?? 'No Content'}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
