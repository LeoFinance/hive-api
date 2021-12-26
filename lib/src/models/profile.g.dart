// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as int,
      name: json['name'] as String,
      created: DateTime.parse(json['created'] as String),
      active: DateTime.parse(json['active'] as String),
      postCount: json['post_count'] as int,
      reputation: (json['reputation'] as num).toDouble(),
      blacklists: json['blacklists'] as List<dynamic>,
      stats: ProfileStats.fromJson(json['stats'] as Map<String, dynamic>),
      metadata:
          ProfileMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created': instance.created.toIso8601String(),
      'active': instance.active.toIso8601String(),
      'post_count': instance.postCount,
      'reputation': instance.reputation,
      'blacklists': instance.blacklists,
      'stats': instance.stats.toJson(),
      'metadata': instance.metadata.toJson(),
    };

ProfileMetadata _$ProfileMetadataFromJson(Map<String, dynamic> json) =>
    ProfileMetadata(
      profile: ProfileMetadataProfile.fromJson(
          json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileMetadataToJson(ProfileMetadata instance) =>
    <String, dynamic>{
      'profile': instance.profile.toJson(),
    };

ProfileMetadataProfile _$ProfileMetadataProfileFromJson(
        Map<String, dynamic> json) =>
    ProfileMetadataProfile(
      name: json['name'] as String,
      about: json['about'] as String,
      website: json['website'] as String,
      location: json['location'] as String,
      coverImage: json['cover_image'] as String,
      profileImage: json['profile_image'] as String,
      blacklistDescription: json['blacklist_description'] as String,
      mutedListDescription: json['muted_list_description'] as String,
    );

Map<String, dynamic> _$ProfileMetadataProfileToJson(
        ProfileMetadataProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'about': instance.about,
      'website': instance.website,
      'location': instance.location,
      'cover_image': instance.coverImage,
      'profile_image': instance.profileImage,
      'blacklist_description': instance.blacklistDescription,
      'muted_list_description': instance.mutedListDescription,
    };

ProfileStats _$ProfileStatsFromJson(Map<String, dynamic> json) => ProfileStats(
      rank: json['rank'] as int,
      following: json['following'] as int,
      followers: json['followers'] as int,
    );

Map<String, dynamic> _$ProfileStatsToJson(ProfileStats instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'following': instance.following,
      'followers': instance.followers,
    };
