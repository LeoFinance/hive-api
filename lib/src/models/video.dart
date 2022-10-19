import 'package:equatable/equatable.dart';
import 'package:leofinance_hive_api/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable(explicitToJson: true)
class Video extends Equatable {
  const Video({
    this.info,
    this.content,
    this.files,
    this.dur,
    this.tag,
    this.thumbnailUrlExternal,
    this.thumbnailUrl,
    this.hide,
    this.nsfw,
    this.oc,
  });

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  final VideoInfo? info;
  final VideoContent? content;
  final Map<String, dynamic>? files;
  final String? dur;
  final String? tag;
  final String? thumbnailUrlExternal;
  final String? thumbnailUrl;
  final int? hide;
  final int? nsfw;
  final int? oc;

  Map<String, dynamic> toJson() => _$VideoToJson(this);

  @override
  List<Object?> get props => [
        info,
        content,
        files,
        dur,
        tag,
        thumbnailUrl,
        thumbnailUrlExternal,
        hide,
        nsfw,
        oc
      ];
}
