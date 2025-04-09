import 'package:flutter/material.dart';
import 'package:github_profile/features/search/view_model/view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoTab extends StatelessWidget {
  const RepoTab({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SearchViewModel>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text("Type: "),
              DropdownButton<String>(
                value: viewModel.repoType,
                items: const [
                  DropdownMenuItem(value: 'all', child: Text('All')),
                  DropdownMenuItem(value: 'owner', child: Text('Owner')),
                  DropdownMenuItem(value: 'member', child: Text('Member')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    viewModel.setRepoType(value);
                    viewModel.searchUser(viewModel.user?.login ?? '');
                  }
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: viewModel.filteredRepos.length,
            itemBuilder: (_, index) {
              final repo = viewModel.filteredRepos[index];
              return ListTile(
                title: Text(repo.name),
                subtitle: Text(repo.description),
                onTap: () async {
                  final uri = Uri.parse(repo.htmlUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
