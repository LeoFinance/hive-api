import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'profile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Profile {
  Profile({
    required this.id,
    required this.name,
    required this.created,
    required this.active,
    required this.postCount,
    required this.reputation,
    required this.blacklists,
    required this.stats,
    required this.metadata,
  });

  final int id;
  final String name;
  final DateTime created;
  final DateTime active;
  final int postCount;
  final double reputation;
  final List<dynamic> blacklists;
  final Stats stats;
  final ProfileMetadata metadata;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ProfileMetadata {
  ProfileMetadata({
    required this.profile,
  });

  final ProfileMetadataProfile profile;

  factory ProfileMetadata.fromJson(Map<String, dynamic> json) =>
      _$ProfileMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileMetadataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ProfileMetadataProfile {
  ProfileMetadataProfile({
    required this.name,
    required this.about,
    required this.website,
    required this.location,
    required this.coverImage,
    required this.profileImage,
    required this.blacklistDescription,
    required this.mutedListDescription,
  });

  final String name;
  final String about;
  final String website;
  final String location;
  final String coverImage;
  final String profileImage;
  final String blacklistDescription;
  final String mutedListDescription;

  factory ProfileMetadataProfile.fromJson(Map<String, dynamic> json) =>
      _$ProfileMetadataProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileMetadataProfileToJson(this);
}