// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_reputations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountReputations _$AccountReputationsFromJson(Map<String, dynamic> json) =>
    AccountReputations(
      reputations: (json['reputations'] as List<dynamic>)
          .map((e) => ReputationElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountReputationsToJson(AccountReputations instance) =>
    <String, dynamic>{
      'reputations': instance.reputations.map((e) => e.toJson()).toList(),
    };

ReputationElement _$ReputationElementFromJson(Map<String, dynamic> json) =>
    ReputationElement(
      account: json['account'] as String,
      reputation: json['reputation'],
    );

Map<String, dynamic> _$ReputationElementToJson(ReputationElement instance) =>
    <String, dynamic>{
      'account': instance.account,
      'reputation': instance.reputation,
    };
