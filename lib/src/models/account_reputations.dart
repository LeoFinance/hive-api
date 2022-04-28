import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_reputations.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class AccountReputations extends Equatable {
  const AccountReputations({
    required this.reputations,
  });

  factory AccountReputations.fromJson(Map<String, dynamic> json) =>
      _$AccountReputationsFromJson(json);

  final List<ReputationElement> reputations;

  Map<String, dynamic> toJson() => _$AccountReputationsToJson(this);

  @override
  List<Object?> get props => [reputations];
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ReputationElement extends Equatable {
  const ReputationElement({
    required this.account,
    required this.reputation,
  });

  factory ReputationElement.fromJson(Map<String, dynamic> json) =>
      _$ReputationElementFromJson(json);

  final String account;
  final dynamic reputation;

  Map<String, dynamic> toJson() => _$ReputationElementToJson(this);

  @override
  List<Object?> get props => [account, reputation];
}
