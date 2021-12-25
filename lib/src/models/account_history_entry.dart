import 'package:json_annotation/json_annotation.dart';

import '../helpers.dart';

part 'account_history_entry.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class AccountHistoryEntry {
  AccountHistoryEntry({
    required this.trxId,
    required this.block,
    required this.trxInBlock,
    required this.opInTrx,
    required this.virtualOp,
    required this.timestamp,
    required this.op,
  });

  static Op _arrayToOp(List<dynamic> ar) =>
      Op(type: ar[0], data: ar[0] == 'vote' ? VoteOp.fromJson(ar[1]) : null);
  static List<dynamic> _opToArray(Op op) => [op.type, op.data];

  final String trxId;
  final int block;
  final int trxInBlock;
  final int opInTrx;
  final int virtualOp;
  final DateTime timestamp;

  @JsonKey(fromJson: _arrayToOp, toJson: _opToArray)
  final Op op;

  factory AccountHistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$AccountHistoryEntryFromJson(json);

  Map<String, dynamic> toJson() => _$AccountHistoryEntryToJson(this);

  @override
  String toString() => 'History $op';
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Op {
  Op({required this.type, required this.data});

  final String type;
  final dynamic data;

  factory Op.fromJson(Map<String, dynamic> json) => _$OpFromJson(json);

  Map<String, dynamic> toJson() => _$OpToJson(this);

  @override
  String toString() => 'Op: $data';
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class VoteOp {
  VoteOp({
    required this.voter,
    required this.author,
    required this.permlink,
    required this.weight,
  });

  final String voter;
  final String author;
  final String permlink;
  final int weight;

  factory VoteOp.fromJson(Map<String, dynamic> json) => _$VoteOpFromJson(json);

  Map<String, dynamic> toJson() => _$VoteOpToJson(this);

  @override
  String toString() => 'Vote: @$author/$permlink: $weight';
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class EffectiveCommentVoteOp {
  EffectiveCommentVoteOp(
      {required this.voter,
      required this.author,
      required this.permlink,
      required this.weight,
      required this.rshares,
      required this.totalVoteWeight,
      required this.pendingPayout});

  final String voter;
  final String author;
  final String permlink;
  final int weight;
  final int rshares;
  final int totalVoteWeight;

  @JsonKey(fromJson: fromHbd, toJson: toHbd)
  final double pendingPayout;

  factory EffectiveCommentVoteOp.fromJson(Map<String, dynamic> json) =>
      _$EffectiveCommentVoteOpFromJson(json);

  Map<String, dynamic> toJson() => _$EffectiveCommentVoteOpToJson(this);

  @override
  String toString() => 'EffectiveCommentVoteOp: @$author/$permlink: $weight';
}
