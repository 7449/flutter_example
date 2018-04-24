class ListEntity {
  final String title;
  final String titleImage;
  final int slug;
  AuthorEntity author;

  ListEntity({this.title, this.titleImage, this.slug, this.author});

  static List<ListEntity> fromJson(List json) {
    return json
        .map((string) => new ListEntity(
            title: string['title'],
            titleImage: string['titleImage'],
            slug: string['slug'],
            author: new AuthorEntity.fromJson(string['author'])))
        .toList();
  }
}

class AuthorEntity {
  final String profileUrl;
  final String bio;
  final String name;

  AuthorEntity({this.profileUrl, this.bio, this.name});

  factory AuthorEntity.fromJson(Map<String, dynamic> json) {
    return new AuthorEntity(
      profileUrl: json['profileUrl'],
      bio: json['bio'],
      name: json['name'],
    );
  }
}
