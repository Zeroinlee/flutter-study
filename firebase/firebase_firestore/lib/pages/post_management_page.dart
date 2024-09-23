import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostManagementPage extends StatefulWidget {
  @override
  _PostManagementPageState createState() => _PostManagementPageState();
}

class _PostManagementPageState extends State<PostManagementPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;

  Future<void> _addPost() async {
    final title = _titleController.text;
    final content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      try {
        // 게시물 추가를 구현하세요.
        await _firestore.collection('posts').add({
          'title': title,
          'content': content,
          'createdAt': Timestamp.now(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Post added successfully!')),
        );

        _titleController.clear();
        _contentController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add post: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both title and content.')),
      );
    }
  }

  Future<void> _updatePost(String postId) async {
    final title = _titleController.text;
    final content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      try {
        // 게시물 업데이트를 구현하세요.
        await _firestore.collection('posts').doc(postId).update({
          'title': title,
          'content': content,
          'updatedAt': Timestamp.now(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Post updated successfully!')),
        );

        _titleController.clear();
        _contentController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update post: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both title and content.')),
      );
    }
  }

  Future<void> _deletePost(String postId) async {
    try {
      // 게시물 삭제를 구현하세요.
      await _firestore.collection('posts').doc(postId).delete();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Post deleted successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete post: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Management'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _contentController,
                  decoration: InputDecoration(labelText: 'Content'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _addPost,
                  child: Text('Add Post'),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('posts').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No posts available.'));
                } else {
                  final posts = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index].data() as Map<String, dynamic>;
                      final postId = posts[index].id;
                      bool isEdit = false;
                      return ListTile(
                        title: Text(post['title'] ?? 'No Title'),
                        subtitle: Text(post['content'] ?? 'No Content'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                if (!isEdit) {
                                  _titleController.text = post['title'] ?? '';
                                  _contentController.text =
                                      post['content'] ?? '';
                                  isEdit = true;
                                } else {
                                  _updatePost(postId);
                                  isEdit = false;
                                }
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _deletePost(postId);
                              },
                            ),
                          ],
                        ),
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
