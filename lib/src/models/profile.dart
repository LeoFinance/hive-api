import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Profile extends Equatable {
  const Profile({
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

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  final int id;
  final String name;
  final DateTime created;
  final DateTime active;
  final int postCount;
  final double reputation;
  final List<dynamic> blacklists;
  final ProfileStats stats;
  final ProfileMetadata metadata;

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        created,
        active,
        postCount,
        reputation,
        blacklists,
        stats,
        metadata
      ];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ProfileMetadata extends Equatable {
  const ProfileMetadata({
    this.profile,
  });

  factory ProfileMetadata.fromJson(Map<String, dynamic> json) =>
      _$ProfileMetadataFromJson(json);

  final ProfileMetadataProfile? profile;

  Map<String, dynamic> toJson() => _$ProfileMetadataToJson(this);

  @override
  List<Object?> get props => [profile];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ProfileMetadataProfile extends Equatable {
  const ProfileMetadataProfile({
    this.name,
    this.about,
    this.website,
    this.location,
    this.coverImage,
    this.profileImage,
    this.blacklistDescription,
    this.mutedListDescription,
    this.dtubePub,
    this.pinned,
    this.version,
  });

  factory ProfileMetadataProfile.fromJson(Map<String, dynamic> json) =>
      _$ProfileMetadataProfileFromJson(json);

  final String? name;
  final String? about;
  final String? website;
  final String? location;
  final String? coverImage;
  final String? profileImage;
  final String? blacklistDescription;
  final String? mutedListDescription;
  final String? dtubePub;
  final String? pinned;
  final int? version;

  Map<String, dynamic> toJson() => _$ProfileMetadataProfileToJson(this);

  @override
  List<Object?> get props => [
        name,
        about,
        website,
        location,
        coverImage,
        profileImage,
        blacklistDescription,
        mutedListDescription,
        dtubePub,
        pinned,
        version
      ];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ProfileStats extends Equatable {
  const ProfileStats({
    required this.rank,
    required this.following,
    required this.followers,
  });

  factory ProfileStats.fromJson(Map<String, dynamic> json) =>
      _$ProfileStatsFromJson(json);

  final int rank;
  final int following;
  final int followers;

  Map<String, dynamic> toJson() => _$ProfileStatsToJson(this);

  @override
  List<Object?> get props => [rank, following, followers];

  @override
  bool get stringify => true;
}
