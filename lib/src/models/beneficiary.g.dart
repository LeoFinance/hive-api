// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Beneficiary _$BeneficiaryFromJson(Map<String, dynamic> json) => Beneficiary(
      account: json['account'] as String,
      weight: json['weight'] as int,
    );

Map<String, dynamic> _$BeneficiaryToJson(Beneficiary instance) =>
    <String, dynamic>{
      'account': instance.account,
      'weight': instance.weight,
    };
