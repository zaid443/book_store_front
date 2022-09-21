class GenreModel {
  GenreModel({
    required this.name,
    required this.genresImageUrl,
  });

  final String name;
  final String genresImageUrl;

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        name: json["name"],
        genresImageUrl: json["genresImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "genresImageUrl": genresImageUrl,
      };
}
