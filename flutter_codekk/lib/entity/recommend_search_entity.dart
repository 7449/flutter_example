import 'package:json_annotation/json_annotation.dart';

part 'recommend_search_entity.g.dart';

@JsonSerializable()
class RecommendSearchEntity extends Object
    with _$RecommendSearchEntitySerializerMixin {
  final List<RecommendArrayEntity> recommendArray;

  factory RecommendSearchEntity.fromJson(Map<String, dynamic> json) =>
      _$RecommendSearchEntityFromJson(json);

  RecommendSearchEntity(this.recommendArray);
}

@JsonSerializable()
class RecommendArrayEntity extends Object
    with _$RecommendArrayEntitySerializerMixin {
  @JsonKey(name: '_id')
  final String id;
  final bool toCodeKKWx;
  final bool isDelete;
  final String createTime;
  final String url;
  final String title;
  final String desc;
  final String type;
  final String userName;
  final String codeKKUrl;
  final bool isFavorite;
  final String encodeUrl;
  final List<ArticleTagsEntity> articleTags;
  final List<String> contentTypes;

  factory RecommendArrayEntity.fromJson(Map<String, dynamic> json) =>
      _$RecommendArrayEntityFromJson(json);

  RecommendArrayEntity(
      this.id,
      this.toCodeKKWx,
      this.isDelete,
      this.createTime,
      this.url,
      this.title,
      this.desc,
      this.type,
      this.userName,
      this.codeKKUrl,
      this.isFavorite,
      this.encodeUrl,
      this.articleTags,
      this.contentTypes);
}

@JsonSerializable()
class ArticleTagsEntity extends Object with _$ArticleTagsEntitySerializerMixin {
  final String createTime;
  final String name;
  final String userName;
  final String type;

  factory ArticleTagsEntity.fromJson(Map<String, dynamic> json) =>
      _$ArticleTagsEntityFromJson(json);

  ArticleTagsEntity(this.createTime, this.name, this.userName, this.type);
}
