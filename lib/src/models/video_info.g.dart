// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoInfo _$VideoInfoFromJson(Map<String, dynamic> json) => VideoInfo(
      platform: json['platform'] as String?,
      title: json['title'] as String,
      author: json['author'] as String,
      permlink: json['permlink'] as String,
      duration: (json['duration'] as num?)?.toDouble(),
      filesize: json['filesize'] as int?,
      file: json['file'] as String?,
      lang: json['lang'] as String?,
      firstUpload: json['firstUpload'] as bool?,
      ipfs: json['ipfs'] as String?,
      ipfsThumbnail: json['ipfsThumbnail'] as String?,
      spritehash: json['spritehash'] as String?,
      snaphash: json['snaphash'] as String?,
    );

Map<String, dynamic> _$VideoInfoToJson(VideoInfo instance) => <String, dynamic>{
      'platform': instance.platform,
      'title': instance.title,
      'author': instance.author,
      'permlink': instance.permlink,
      'duration': instance.duration,
      'filesize': instance.filesize,
      'file': instance.file,
      'lang': instance.lang,
      'firstUpload': instance.firstUpload,
      'ipfs': instance.ipfs,
      'ipfsThumbnail': instance.ipfsThumbnail,
      'spritehash': instance.spritehash,
      'snaphash': instance.snaphash,
    };
