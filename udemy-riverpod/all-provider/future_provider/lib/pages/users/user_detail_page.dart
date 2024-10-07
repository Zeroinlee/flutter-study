import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/pages/users/users_providers.dart';

class UserDetailPage extends ConsumerWidget {
  final int id;
  const UserDetailPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetail = ref.watch(userDetailProvider(id));

    return Scaffold(
        appBar: AppBar(
          title: const Text('User Detail'),
        ),
        body: userDetail.when(
          data: (data) {
            return ListView(
              children: [
                Text(data.name),
                Text(data.username),
                Text(data.email),
                Text(data.phone),
                Text(data.website),
              ],
            );
          },
          error: (error, stackTrace) {
            return Text(error.toString());
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
