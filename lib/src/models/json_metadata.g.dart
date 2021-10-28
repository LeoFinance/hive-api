// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonMetadata _$JsonMetadataFromJson(Map<String, dynamic> json) => JsonMetadata(
      app: json['app'] as String?,
      type: json['type'] as String?,
      format: json['format'] as String? ?? 'markdown',
      canonicalUrl: json['canonical_url'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      links:
          (json['links'] as List<dynamic>?)?.map((e) => e as String).toList(),
      image: json['image'],
      video: json['video'] == null
          ? null
          : Video.fromJson(json['video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JsonMetadataToJson(JsonMetadata instance) =>
    <String, dynamic>{
      'app': instance.app,
      'type': instance.type,
      'format': instance.format,
      'canonical_url': instance.canonicalUrl,
      'tags': instance.tags,
      'links': instance.links,
      'video': instance.video?.toJson(),
      'image': instance.image,
    };
