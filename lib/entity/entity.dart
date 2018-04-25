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

class DetailEntity {
  final String titleImage;
  final String title;
  final String content;
  AuthorEntity author;

  DetailEntity({this.title, this.titleImage, this.content, this.author});

  static DetailEntity fromJson(Map<String, dynamic> json) {
    return new DetailEntity(
      title: json['title'],
      titleImage: json['titleImage'],
      content: json['content'],
      author: new AuthorEntity.fromJson(json['author']),
    );
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
