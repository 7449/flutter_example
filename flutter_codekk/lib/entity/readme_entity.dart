import 'package:json_annotation/json_annotation.dart';

part 'readme_entity.g.dart';

@JsonSerializable()
class ReadmeEntity extends Object with _$ReadmeEntitySerializerMixin {
  @JsonKey(name: '_id')
  final String id;
  final String summaryId;
  final String content;
  final String title;
  final bool isFavorite;

  factory ReadmeEntity.fromJson(Map<String, dynamic> json) =>
      _$ReadmeEntityFromJson(json);

  ReadmeEntity(
      this.id, this.summaryId, this.content, this.title, this.isFavorite);
}
