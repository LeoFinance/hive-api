// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountNotification _$AccountNotificationFromJson(Map<String, dynamic> json) =>
    AccountNotification(
      id: json['id'] as int,
      type: json['type'] as String,
      score: json['score'] as int,
      date: forceUtcDate(json['date'] as String),
      msg: json['msg'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$AccountNotificationToJson(
        AccountNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'score': instance.score,
      'date': stripUtcZ(instance.date),
      'msg': instance.msg,
      'url': instance.url,
    };
