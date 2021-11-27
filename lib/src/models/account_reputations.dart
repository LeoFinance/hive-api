import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_reputations.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class AccountReputations extends Equatable {
  AccountReputations({
    required this.reputations,
  });

  final List<ReputationElement> reputations;

  factory AccountReputations.fromJson(Map<String, dynamic> json) =>
      _$AccountReputationsFromJson(json);

  Map<String, dynamic> toJson() => _$AccountReputationsToJson(this);

  @override
  List<Object> get props => [reputations];
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ReputationElement extends Equatable {
  ReputationElement({
    required this.account,
    required this.reputation,
  });

  final String account;
  final dynamic reputation;

  factory ReputationElement.fromJson(Map<String, dynamic> json) =>
      _$ReputationElementFromJson(json);

  Map<String, dynamic> toJson() => _$ReputationElementToJson(this);

  @override
  List<Object> get props => [account, reputation];
}
