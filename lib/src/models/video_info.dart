import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_info.g.dart';

@JsonSerializable()
class VideoInfo extends Equatable {
  VideoInfo({
    required this.platform,
    required this.title,
    required this.author,
    required this.permlink,
    required this.duration,
    required this.filesize,
    required this.file,
    required this.lang,
    required this.firstUpload,
    required this.ipfs,
    required this.ipfsThumbnail,
  });

  final String platform;
  final String title;
  final String author;
  final String permlink;
  final double duration;
  final int filesize;
  final String file;
  final String lang;
  final bool firstUpload;
  final String ipfs;
  final String ipfsThumbnail;

  factory VideoInfo.fromJson(Map<String, dynamic> json) =>
      _$VideoInfoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoInfoToJson(this);

  @override
  List<Object> get props => [
        platform,
        title,
        author,
        permlink,
        duration,
        filesize,
        file,
        lang,
        firstUpload,
        ipfs,
        ipfsThumbnail
      ];
}
