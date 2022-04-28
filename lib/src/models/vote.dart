import 'package:json_annotation/json_annotation.dart';

part 'vote.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Vote {
  const Vote({
    required this.id,
    required this.voter,
    required this.author,
    required this.permlink,
    required this.weight,
    required this.rshares,
    required this.votePercent,
    required this.lastUpdate,
    required this.numChanges,
  });

  factory Vote.fromJson(Map<String, dynamic> json) => _$VoteFromJson(json);

  final int id;
  final String voter;
  final String author;
  final String permlink;
  final int weight;
  final int rshares;
  final int votePercent;
  final DateTime lastUpdate;
  final int numChanges;

  Map<String, dynamic> toJson() => _$VoteToJson(this);

  @override
  String toString() => 'Vote @$author/$permlink: $rshares';
}
