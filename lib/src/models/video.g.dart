// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      info: VideoInfo.fromJson(json['info'] as Map<String, dynamic>),
      content: VideoContent.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'info': instance.info.toJson(),
      'content': instance.content.toJson(),
    };
