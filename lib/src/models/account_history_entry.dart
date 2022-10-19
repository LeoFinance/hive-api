import 'package:hive_api/src/helpers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_history_entry.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  createFactory: false,
  createToJson: false,
)
class AccountHistoryEntry {
  const AccountHistoryEntry({
    required this.historyIndex,
    required this.trxId,
    required this.block,
    required this.trxInBlock,
    required this.opInTrx,
    required this.virtualOp,
    required this.timestamp,
    required this.op,
  });

  // This is the easiest way that doesn't break the current declarative
  // implementation ongoing for the rest of structs. This is required as account
  // history is returned as a tuple, and for no apparent reason, json-annotate
  // library doesn't count root array as valid JSON (which it is), which makes
  // tuples not being able to used as root in declarative approach. We need
  // historyIndex to query far away stuff from history.
  factory AccountHistoryEntry.fromJson(List<dynamic> tupleJson) {
    final index = tupleJson[0] as int;
    final data = tupleJson[1] as Map<String, dynamic>;

    return AccountHistoryEntry(
      historyIndex: index,
      trxId: data['trx_id'] as String,
      block: data['block'] as int,
      trxInBlock: data['trx_in_block'] as int,
      opInTrx: data['op_in_trx'] as int,
      virtualOp: data['virtual_op'] as bool,
      timestamp: forceUtcDate(data['timestamp'] as String),
      op: AccountHistoryEntry._arrayToOp(data['op'] as List),
    );
  }

  List<dynamic> toJson() => <dynamic>[
        historyIndex,
        <String, dynamic>{
          'trx_id': trxId,
          'block': block,
          'trx_in_block': trxInBlock,
          'op_in_trx': opInTrx,
          'virtual_op': virtualOp,
          'timestamp': stripUtcZ(timestamp),
          'op': AccountHistoryEntry._opToArray(op),
        }
      ];

  static Op _arrayToOp(List<dynamic> ar) => Op(
        type: ar[0] as String,
        data: ar[0] == 'vote'
            ? VoteOp.fromJson(ar[1] as Map<String, dynamic>)
            : null,
      );

  static List<dynamic> _opToArray(Op op) => <dynamic>[op.type, op.data];

  final int historyIndex;
  final String trxId;
  final int block;
  final int trxInBlock;
  final int opInTrx;
  final bool virtualOp;

  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime timestamp;

  @JsonKey(fromJson: _arrayToOp, toJson: _opToArray)
  final Op op;

  @override
  String toString() => 'History $op';
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Op {
  const Op({required this.type, required this.data});

  factory Op.fromJson(Map<String, dynamic> json) => _$OpFromJson(json);

  final String type;
  final dynamic data;

  Map<String, dynamic> toJson() => _$OpToJson(this);

  @override
  String toString() => 'Op: $data';
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class VoteOp {
  const VoteOp({
    required this.voter,
    required this.author,
    required this.permlink,
    required this.weight,
  });

  factory VoteOp.fromJson(Map<String, dynamic> json) => _$VoteOpFromJson(json);

  final String voter;
  final String author;
  final String permlink;
  final int weight;

  Map<String, dynamic> toJson() => _$VoteOpToJson(this);

  @override
  String toString() => 'Vote: @$author/$permlink: $weight';
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class EffectiveCommentVoteOp {
  const EffectiveCommentVoteOp({
    required this.voter,
    required this.author,
    required this.permlink,
    required this.weight,
    required this.rshares,
    required this.totalVoteWeight,
    required this.pendingPayout,
  });

  factory EffectiveCommentVoteOp.fromJson(Map<String, dynamic> json) =>
      _$EffectiveCommentVoteOpFromJson(json);

  final String voter;
  final String author;
  final String permlink;
  final int weight;
  final int rshares;
  final int totalVoteWeight;

  @JsonKey(fromJson: fromHbd, toJson: toHbd)
  final double pendingPayout;

  Map<String, dynamic> toJson() => _$EffectiveCommentVoteOpToJson(this);

  @override
  String toString() => 'EffectiveCommentVoteOp: @$author/$permlink: $weight';
}
