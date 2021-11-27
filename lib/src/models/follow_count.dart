import 'package:json_annotation/json_annotation.dart';

part 'follow_count.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FollowCount {
  FollowCount({
    required this.account,
    required this.followingCount,
    required this.followerCount,
  });

  final String account;
  final int followingCount;
  final int followerCount;

  factory FollowCount.fromJson(Map<String, dynamic> json) =>
      _$FollowCountFromJson(json);

  Map<String, dynamic> toJson() => _$FollowCountToJson(this);
}
