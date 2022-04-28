import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'active_vote.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ActiveVote extends Equatable {
  const ActiveVote({
    required this.rshares,
    required this.voter,
  });

  factory ActiveVote.fromJson(Map<String, dynamic> json) =>
      _$ActiveVoteFromJson(json);

  final int rshares;
  final String voter;

  Map<String, dynamic> toJson() => _$ActiveVoteToJson(this);

  @override
  List<Object?> get props => [rshares, voter];
}
