// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      info: json['info'] == null
          ? null
          : VideoInfo.fromJson(json['info'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : VideoContent.fromJson(json['content'] as Map<String, dynamic>),
      files: (json['files'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      dur: json['dur'] as String?,
      tag: json['tag'] as String?,
      thumbnailUrlExternal: json['thumbnailUrlExternal'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      hide: json['hide'] as int?,
      nsfw: json['nsfw'] as int?,
      oc: json['oc'] as int?,
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'info': instance.info?.toJson(),
      'content': instance.content?.toJson(),
      'files': instance.files,
      'dur': instance.dur,
      'tag': instance.tag,
      'thumbnailUrlExternal': instance.thumbnailUrlExternal,
      'thumbnailUrl': instance.thumbnailUrl,
      'hide': instance.hide,
      'nsfw': instance.nsfw,
      'oc': instance.oc,
    };
