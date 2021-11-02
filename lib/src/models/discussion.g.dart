// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discussion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Discussion _$DiscussionFromJson(Map<String, dynamic> json) => Discussion(
      Post.fromJson(json['post'] as Map<String, dynamic>),
      comments: (json['comments'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Post.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$DiscussionToJson(Discussion instance) =>
    <String, dynamic>{
      'post': instance.post.toJson(),
      'comments': instance.comments.map((k, e) => MapEntry(k, e.toJson())),
    };
