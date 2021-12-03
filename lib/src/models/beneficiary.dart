import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'beneficiary.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Beneficiary extends Equatable {
  final String account;
  final int weight;

  const Beneficiary({required this.account, required this.weight});

  factory Beneficiary.fromJson(Map<String, dynamic> json) =>
      _$BeneficiaryFromJson(json);

  Map<String, dynamic> toJson() => _$BeneficiaryToJson(this);

  @override
  List<Object> get props => [account, weight];

  @override
  bool get stringify => true;
}
