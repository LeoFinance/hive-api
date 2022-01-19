// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_history_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountHistoryEntry _$AccountHistoryEntryFromJson(Map<String, dynamic> json) =>
    AccountHistoryEntry(
      trxId: json['trx_id'] as String,
      block: json['block'] as int,
      trxInBlock: json['trx_in_block'] as int,
      opInTrx: json['op_in_trx'] as int,
      virtualOp: json['virtual_op'] as int,
      timestamp: forceUtcDate(json['timestamp'] as String),
      op: AccountHistoryEntry._arrayToOp(json['op'] as List),
    );

Map<String, dynamic> _$AccountHistoryEntryToJson(
        AccountHistoryEntry instance) =>
    <String, dynamic>{
      'trx_id': instance.trxId,
      'block': instance.block,
      'trx_in_block': instance.trxInBlock,
      'op_in_trx': instance.opInTrx,
      'virtual_op': instance.virtualOp,
      'timestamp': stripUtcZ(instance.timestamp),
      'op': AccountHistoryEntry._opToArray(instance.op),
    };

Op _$OpFromJson(Map<String, dynamic> json) => Op(
      type: json['type'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$OpToJson(Op instance) => <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };

VoteOp _$VoteOpFromJson(Map<String, dynamic> json) => VoteOp(
      voter: json['voter'] as String,
      author: json['author'] as String,
      permlink: json['permlink'] as String,
      weight: json['weight'] as int,
    );

Map<String, dynamic> _$VoteOpToJson(VoteOp instance) => <String, dynamic>{
      'voter': instance.voter,
      'author': instance.author,
      'permlink': instance.permlink,
      'weight': instance.weight,
    };

EffectiveCommentVoteOp _$EffectiveCommentVoteOpFromJson(
        Map<String, dynamic> json) =>
    EffectiveCommentVoteOp(
      voter: json['voter'] as String,
      author: json['author'] as String,
      permlink: json['permlink'] as String,
      weight: json['weight'] as int,
      rshares: json['rshares'] as int,
      totalVoteWeight: json['total_vote_weight'] as int,
      pendingPayout: fromHbd(json['pending_payout'] as String),
    );

Map<String, dynamic> _$EffectiveCommentVoteOpToJson(
        EffectiveCommentVoteOp instance) =>
    <String, dynamic>{
      'voter': instance.voter,
      'author': instance.author,
      'permlink': instance.permlink,
      'weight': instance.weight,
      'rshares': instance.rshares,
      'total_vote_weight': instance.totalVoteWeight,
      'pending_payout': toHbd(instance.pendingPayout),
    };
