import 'package:flutter/material.dart';
import 'package:github_profile/features/search/view/widget/profile_tab.dart';
import 'package:github_profile/features/search/view/widget/repo_tab.dart';
import 'package:github_profile/features/search/view_model/view_model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SearchViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('GitHub User Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter GitHub username',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    viewModel.searchUser(_controller.text.trim());
                  },
                ),
              ),
            ),
          ),
          if (viewModel.isLoading)
            const CircularProgressIndicator()
          else if (viewModel.errorMessage.isNotEmpty)
            Text(viewModel.errorMessage)
          else if (viewModel.user != null)
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: const [
                    TabBar(
                      tabs: [Tab(text: "Profile"), Tab(text: "Repositories")],
                    ),
                    Expanded(
                      child: TabBarView(children: [ProfileTab(), RepoTab()]),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
