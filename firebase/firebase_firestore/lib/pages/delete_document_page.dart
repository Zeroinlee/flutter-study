import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteDocumentPage extends StatefulWidget {
  @override
  _DeleteDocumentPageState createState() => _DeleteDocumentPageState();
}

class _DeleteDocumentPageState extends State<DeleteDocumentPage> {
  final _firestore = FirebaseFirestore.instance;
  final String _documentId = 'my_document_id'; // 최근 documentId 가져오기

  Future<void> _deleteDocument() async {
    try {
      // 문서 읽기를 구현하세요.
      await _firestore.collection('documents').doc(_documentId).delete();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Document deleted successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete document: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Read Document from Firestore'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _deleteDocument();
            },
            child: Text('Delete Document'),
          ),
        ));
  }
}
