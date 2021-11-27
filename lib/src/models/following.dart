import 'package:json_annotation/json_annotation.dart';

part 'following.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Following {
  Following({
    required this.follower,
    required this.following,
    required this.what,
  });

  final String follower;
  final String following;
  final List<String> what;

  factory Following.fromJson(Map<String, dynamic> json) =>
      _$FollowingFromJson(json);

  Map<String, dynamic> toJson() => _$FollowingToJson(this);
}
