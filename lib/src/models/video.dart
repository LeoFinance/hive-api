import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'video.g.dart';

@JsonSerializable(explicitToJson: true)
class Video extends Equatable {
  Video({
    required this.info,
    required this.content,
  });

  final VideoInfo info;
  final VideoContent content;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

  @override
  List<Object> get props => [info, content];
}
