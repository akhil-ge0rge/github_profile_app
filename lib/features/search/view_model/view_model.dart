import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:github_profile/features/search/model/repo_model.dart';
import 'package:github_profile/features/search/model/user_model.dart';
import 'package:github_profile/services/github_services.dart';

class SearchViewModel extends ChangeNotifier {
  final _service = GithubServices();

  UserModel? user;
  List<RepoModel> repositories = [];
  List<RepoModel> filteredRepos = [];

  bool isLoading = false;
  bool isRepoLoading = false;
  String errorMessage = '';

  String repoType = 'all';

  Future<void> searchUser(String username) async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.first == ConnectivityResult.none) {
      errorMessage = 'No internet connection';
      isLoading = false;
      notifyListeners();
      return;
    }

    try {
      user = await _service.fetchUser(username);
      repositories = await _service.fetchRepos(username, type: repoType);
      filteredRepos = repositories;
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  void setRepoType(String type) {
    repoType = type;
    notifyListeners();
  }
}
