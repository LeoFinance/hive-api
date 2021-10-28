// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_vote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveVote _$ActiveVoteFromJson(Map<String, dynamic> json) => ActiveVote(
      rshares: json['rshares'] as int,
      voter: json['voter'] as String,
    );

Map<String, dynamic> _$ActiveVoteToJson(ActiveVote instance) =>
    <String, dynamic>{
      'rshares': instance.rshares,
      'voter': instance.voter,
    };
