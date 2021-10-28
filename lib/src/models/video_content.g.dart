// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoContent _$VideoContentFromJson(Map<String, dynamic> json) => VideoContent(
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$VideoContentToJson(VideoContent instance) =>
    <String, dynamic>{
      'description': instance.description,
      'tags': instance.tags,
    };
