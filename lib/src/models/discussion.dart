import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'discussion.g.dart';

@JsonSerializable(explicitToJson: true)
class Discussion extends Equatable {
  final Post root;
  final Map<String, Post> comments;

  Discussion(this.root, {this.comments = const {}});

  factory Discussion.fromJson(Map<String, dynamic> json) {
    final rootKey = json.keys.first;
    final rootValue = json[rootKey];
    json.remove(rootKey);

    return Discussion(Post.fromJson(rootValue),
        comments: json.map((k, v) => MapEntry(k, Post.fromJson(v))));
  }

  Map<String, dynamic> toJson() => _$DiscussionToJson(this);

  @override
  List<Object?> get props => [root, comments];

  @override
  String toString() => 'Discussion len=${comments.length}';
}
