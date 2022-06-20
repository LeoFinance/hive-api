import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_info.g.dart';

@JsonSerializable()
class VideoInfo extends Equatable {
  const VideoInfo({
    this.platform,
    required this.title,
    required this.author,
    required this.permlink,
    this.duration,
    this.filesize,
    this.file,
    this.lang,
    this.firstUpload,
    this.ipfs,
    this.ipfsThumbnail,
    this.spritehash,
    this.snaphash,
  });

  factory VideoInfo.fromJson(Map<String, dynamic> json) =>
      _$VideoInfoFromJson(json);

  final String? platform;
  final String title;
  final String author;
  final String permlink;
  final double? duration;
  final int? filesize;
  final String? file;
  final String? lang;
  final bool? firstUpload;
  final String? ipfs;
  final String? ipfsThumbnail;
  final String? spritehash;
  final String? snaphash;

  Map<String, dynamic> toJson() => _$VideoInfoToJson(this);

  @override
  List<Object?> get props => [
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
        ipfsThumbnail,
        spritehash,
        snaphash
      ];
}
