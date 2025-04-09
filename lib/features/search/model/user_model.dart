class UserModel {
  final String avatarUrl;
  final String name;
  final String bio;
  final String login;
  final int publicRepos;

  UserModel({
    required this.avatarUrl,
    required this.name,
    required this.bio,
    required this.login,
    required this.publicRepos,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      avatarUrl: json['avatar_url'] ?? '',
      login: json['login'] ?? '',
      name: json['name'] ?? '',
      bio: json['bio'] ?? '',
      publicRepos: json['public_repos'] ?? 0,
    );
  }
}
