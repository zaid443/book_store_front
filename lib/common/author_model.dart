class AuthorModel {
  AuthorModel({
    required this.name,
    required this.authorImageUrl,
  });

  final String name;
  final String authorImageUrl;

  factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
        name: json["name"],
        authorImageUrl: json["authorImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "authorImageUrl": authorImageUrl,
      };
}
