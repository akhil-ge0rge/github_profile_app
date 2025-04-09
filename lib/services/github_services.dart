import 'dart:convert';

import 'package:github_profile/features/search/model/repo_model.dart';
import 'package:github_profile/features/search/model/user_model.dart';
import 'package:http/http.dart' as http;

class GithubServices {
  final baseUrl = "https://api.github.com/users";

  Future<UserModel> fetchUser(String username) async {
    final response = await http.get(Uri.parse('$baseUrl/$username'));
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("User not found");
    }
  }

  Future<List<RepoModel>> fetchRepos(
    String username, {
    String type = 'all',
  }) async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/$username/repos?type=$type'),
    );
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => RepoModel.fromJson(json)).toList();
    } else {
      throw Exception("Repos not found");
    }
  }
}
