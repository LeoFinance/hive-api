import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_notification.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class AccountNotification extends Equatable {
  AccountNotification({
    required this.id,
    required this.type,
    required this.score,
    required this.date,
    required this.msg,
    required this.url,
  });

  final int id;
  final String type;
  final int score;
  final DateTime date;
  final String msg;
  final String url;

  @override
  List<Object> get props => [id, type, score, date, msg, url];

  factory AccountNotification.fromJson(Map<String, dynamic> json) =>
      _$AccountNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$AccountNotificationToJson(this);
}