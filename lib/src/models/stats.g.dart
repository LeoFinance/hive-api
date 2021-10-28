// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      hide: json['hide'] as bool,
      gray: json['gray'] as bool,
      totalVotes: json['total_votes'] as num,
      flagWeight: json['flag_weight'] as num,
      isPinned: json['is_pinned'] as bool?,
    );

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'hide': instance.hide,
      'gray': instance.gray,
      'total_votes': instance.totalVotes,
      'flag_weight': instance.flagWeight,
      'is_pinned': instance.isPinned,
    };
