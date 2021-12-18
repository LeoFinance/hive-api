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
      timestamp: DateTime.parse(json['timestamp'] as String),
      op: Op.fromJson(json['op'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountHistoryEntryToJson(
        AccountHistoryEntry instance) =>
    <String, dynamic>{
      'trx_id': instance.trxId,
      'block': instance.block,
      'trx_in_block': instance.trxInBlock,
      'op_in_trx': instance.opInTrx,
      'virtual_op': instance.virtualOp,
      'timestamp': instance.timestamp.toIso8601String(),
      'op': instance.op.toJson(),
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
