import 'package:flutter/material.dart';
import 'package:github_profile/features/search/view_model/view_model.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<SearchViewModel>(context).user;

    if (user == null) return const Center(child: Text('No user found'));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.avatarUrl),
          ),
          const SizedBox(height: 12),
          Text(user.name, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 8),
          Text(user.bio),
          const SizedBox(height: 12),
          Text("Repositories: ${user.publicRepos}"),
        ],
      ),
    );
  }
}
