import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'stats.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Stats {
  final bool hide;
  final bool gray;
  final num totalVotes;
  final num flagWeight;
  final bool? isPinned;

  Stats(
      {required this.hide,
      required this.gray,
      required this.totalVotes,
      required this.flagWeight,
      this.isPinned});

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);
}
