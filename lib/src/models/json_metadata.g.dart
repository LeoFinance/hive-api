// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonMetadata _$JsonMetadataFromJson(Map<String, dynamic> json) => JsonMetadata(
      app: json['app'] as String?,
      type: json['type'] as String?,
      format: json['format'] as String? ?? 'markdown',
      links: forceList(json['links']),
      canonicalUrl: json['canonical_url'] as String?,
      tags: forceList(json['tags']),
      image: forceList(json['image']),
      video: json['video'] == null
          ? null
          : Video.fromJson(json['video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JsonMetadataToJson(JsonMetadata instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('app', instance.app);
  writeNotNull('type', instance.type);
  val['format'] = instance.format;
  writeNotNull('links', instance.links);
  writeNotNull('canonical_url', instance.canonicalUrl);
  writeNotNull('tags', instance.tags);
  writeNotNull('video', instance.video?.toJson());
  writeNotNull('image', instance.image);
  return val;
}
