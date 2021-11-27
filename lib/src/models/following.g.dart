// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Following _$FollowingFromJson(Map<String, dynamic> json) => Following(
      follower: json['follower'] as String,
      following: json['following'] as String,
      what: (json['what'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FollowingToJson(Following instance) => <String, dynamic>{
      'follower': instance.follower,
      'following': instance.following,
      'what': instance.what,
    };
