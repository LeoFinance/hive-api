import 'package:json_annotation/json_annotation.dart';

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

  final String trxId;
  final int block;
  final int trxInBlock;
  final int opInTrx;
  final int virtualOp;
  final DateTime timestamp;
  final Op op;

  factory AccountHistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$AccountHistoryEntryFromJson(json);

  Map<String, dynamic> toJson() => _$AccountHistoryEntryToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Op {
  Op({required this.type, required this.data});

  final String type;
  final dynamic data;

  factory Op.fromJson(Map<String, dynamic> json) => _$OpFromJson(json);

  Map<String, dynamic> toJson() => _$OpToJson(this);
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
}
