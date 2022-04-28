import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_content.g.dart';

@JsonSerializable()
class VideoContent extends Equatable {
  const VideoContent({
    required this.description,
    required this.tags,
  });

  factory VideoContent.fromJson(Map<String, dynamic> json) =>
      _$VideoContentFromJson(json);

  final String description;
  final List<String> tags;

  Map<String, dynamic> toJson() => _$VideoContentToJson(this);

  @override
  List<Object?> get props => [description, tags];
}
