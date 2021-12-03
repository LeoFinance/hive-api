import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'json_metadata.g.dart';

@JsonSerializable(
    fieldRename: FieldRename.snake, explicitToJson: true, includeIfNull: false)
class JsonMetadata extends Equatable {
  final String? app;
  final String? type;
  final String format;
  final String? canonicalUrl;
  final List<String>? tags;
  final List<String>? links;
  final Video? video;

  // Might be a String or a list of Strings
  final dynamic image;

  JsonMetadata(
      {this.app,
      this.type,
      this.format = 'markdown',
      this.canonicalUrl,
      this.tags,
      this.links,
      this.image,
      this.video});

  factory JsonMetadata.fromJson(Map<String, dynamic> json) =>
      _$JsonMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$JsonMetadataToJson(this);

  @override
  List<Object?> get props => [app, format, tags, links, image];

  @override
  bool get stringify => true;
}
