// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unread_notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnreadNotifications _$UnreadNotificationsFromJson(Map<String, dynamic> json) =>
    UnreadNotifications(
      lastread: DateTime.parse(json['lastread'] as String),
      unread: json['unread'] as int,
    );

Map<String, dynamic> _$UnreadNotificationsToJson(
        UnreadNotifications instance) =>
    <String, dynamic>{
      'lastread': instance.lastread.toIso8601String(),
      'unread': instance.unread,
    };
