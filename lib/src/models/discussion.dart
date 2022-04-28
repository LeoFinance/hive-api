import 'package:equatable/equatable.dart';
import 'package:hive_api/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'discussion.g.dart';

@JsonSerializable(explicitToJson: true)
class Discussion extends Equatable {
  const Discussion(this.post, {this.comments = const {}});

  factory Discussion.fromJson(Map<String, dynamic> json) {
    final rootKey = json.keys.first;
    final rootValue = json[rootKey] as Map<String, dynamic>;
    json.remove(rootKey);

    return Discussion(
      Post.fromJson(rootValue),
      comments: json.map(
        (k, dynamic v) => MapEntry(k, Post.fromJson(v as Map<String, dynamic>)),
      ),
    );
  }

  final Post post;
  final Map<String, Post> comments;

  Map<String, dynamic> toJson() => _$DiscussionToJson(this);

  @override
  List<Object?> get props => [post, comments];

  @override
  String toString() => 'Discussion len=${comments.length}';
}
