import 'package:equatable/equatable.dart';
import 'package:leofinance_hive_api/src/helpers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_reputation.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class AccountReputation extends Equatable {
  const AccountReputation({
    required this.account,
    required this.reputation,
  });

  factory AccountReputation.fromJson(Map<String, dynamic> json) =>
      _$AccountReputationFromJson(json);

  final String account;

  @JsonKey(fromJson: forceString)
  final String reputation;

  Map<String, dynamic> toJson() => _$AccountReputationToJson(this);

  @override
  List<Object?> get props => [account, reputation];
}
