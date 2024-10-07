import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/pages/users/user_detail_page.dart';
import 'package:future_provider/pages/users/users_providers.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: userList.when(
        data: (data) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final user = data[index];

              return ListTile(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UserDetailPage(id: user.id),
                  ),
                ),
                leading: CircleAvatar(
                  child: Text(user.id.toString()),
                ),
                title: Text(user.name),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: data.length,
          );
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
