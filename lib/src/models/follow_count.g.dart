// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowCount _$FollowCountFromJson(Map<String, dynamic> json) => FollowCount(
      account: json['account'] as String,
      followingCount: json['following_count'] as int,
      followerCount: json['follower_count'] as int,
    );

Map<String, dynamic> _$FollowCountToJson(FollowCount instance) =>
    <String, dynamic>{
      'account': instance.account,
      'following_count': instance.followingCount,
      'follower_count': instance.followerCount,
    };
