class RepoModel {
  final String name;
  final String htmlUrl;
  final String description;

  RepoModel({
    required this.name,
    required this.htmlUrl,
    required this.description,
  });

  factory RepoModel.fromJson(Map<String, dynamic> json) {
    return RepoModel(
      name: json['name'] ?? '',
      htmlUrl: json['html_url'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
