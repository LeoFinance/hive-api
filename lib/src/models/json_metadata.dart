import 'package:equatable/equatable.dart';
import 'package:hive_api/src/helpers.dart';
import 'package:hive_api/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'json_metadata.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
class JsonMetadata extends Equatable {
  const JsonMetadata({
    this.app,
    this.type,
    this.format = 'markdown',
    this.links,
    this.canonicalUrl,
    this.tags,
    this.image,
    this.video,
  });

  factory JsonMetadata.fromJson(Map<String, dynamic> json) =>
      _$JsonMetadataFromJson(json);

  static const empty = JsonMetadata();

  final String? app;
  final String? type;
  final String format;

  @JsonKey(fromJson: forceList)
  final List<String>? links;

  final String? canonicalUrl;

  @JsonKey(fromJson: forceList)
  final List<String>? tags;

  final Video? video;

  // Might be a String or a list of Strings
  @JsonKey(fromJson: forceList)
  final List<String>? image;

  Map<String, dynamic> toJson() => _$JsonMetadataToJson(this);

  @override
  List<Object?> get props =>
      [app, type, format, links, canonicalUrl, tags, image, video];

  @override
  bool get stringify => true;
}
