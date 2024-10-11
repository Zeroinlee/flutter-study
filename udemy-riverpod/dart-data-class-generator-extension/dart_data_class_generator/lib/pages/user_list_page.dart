import 'package:dart_data_class_generator/pages/user_details_page.dart';
import 'package:flutter/material.dart';

import 'package:dart_data_class_generator/repositories/fetch_users.dart';

import '../models/user.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> users = [];
  String error = '';
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchUsers();
  }

  void _fetchUsers() async {
    try {
      setState(() {
        loading = true;
      });

      users = await fetchUsers();
      error = '';
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : error.isEmpty
              ? listUser(users)
              // ListUsers(users: users)
              : buildError(),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        children: [
          Text(error),
          OutlinedButton(
            onPressed: _fetchUsers,
            child: const Text('Retry'),
          )
        ],
      ),
    );
  }

  Widget listUser(List<User> users) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final user = users[index];

        return ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDetailsPage(user: user),
              )),
          leading: CircleAvatar(
            child: Text(user.id.toString()),
          ),
          title: Text(user.name),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: users.length,
    );
  }
}

class ListUsers extends StatelessWidget {
  final List<User> users;
  const ListUsers({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final user = users[index];

        return ListTile(
          leading: CircleAvatar(
            child: Text(user.id.toString()),
          ),
          title: Text(user.name),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: users.length,
    );
  }
}
