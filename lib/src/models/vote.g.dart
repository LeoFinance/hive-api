// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vote _$VoteFromJson(Map<String, dynamic> json) => Vote(
      id: json['id'] as int,
      voter: json['voter'] as String,
      author: json['author'] as String,
      permlink: json['permlink'] as String,
      weight: json['weight'] as int,
      rshares: json['rshares'] as int,
      votePercent: json['vote_percent'] as int,
      lastUpdate: DateTime.parse(json['last_update'] as String),
      numChanges: json['num_changes'] as int,
    );

Map<String, dynamic> _$VoteToJson(Vote instance) => <String, dynamic>{
      'id': instance.id,
      'voter': instance.voter,
      'author': instance.author,
      'permlink': instance.permlink,
      'weight': instance.weight,
      'rshares': instance.rshares,
      'vote_percent': instance.votePercent,
      'last_update': instance.lastUpdate.toIso8601String(),
      'num_changes': instance.numChanges,
    };
