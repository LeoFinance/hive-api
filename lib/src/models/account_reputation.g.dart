// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_reputation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountReputation _$AccountReputationFromJson(Map<String, dynamic> json) =>
    AccountReputation(
      account: json['account'] as String,
      reputation: forceString(json['reputation']),
    );

Map<String, dynamic> _$AccountReputationToJson(AccountReputation instance) =>
    <String, dynamic>{
      'account': instance.account,
      'reputation': instance.reputation,
    };
