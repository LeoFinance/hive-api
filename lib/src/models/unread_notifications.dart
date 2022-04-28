import 'package:json_annotation/json_annotation.dart';

part 'unread_notifications.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UnreadNotifications {
  UnreadNotifications({
    required this.lastread,
    required this.unread,
  });

  factory UnreadNotifications.fromJson(Map<String, dynamic> json) =>
      _$UnreadNotificationsFromJson(json);

  final DateTime lastread;
  final int unread;

  Map<String, dynamic> toJson() => _$UnreadNotificationsToJson(this);
}
