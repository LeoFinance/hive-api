import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:leofinance_hive_api/src/helpers.dart';
import 'package:leofinance_hive_api/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'discussion_by.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DiscussionBy extends Equatable {
  const DiscussionBy({
    required this.postId,
    required this.author,
    required this.permlink,
    required this.category,
    required this.title,
    required this.body,
    required this.jsonMetadata,
    required this.created,
    required this.lastUpdate,
    required this.depth,
    required this.children,
    required this.netRshares,
    required this.lastPayout,
    required this.cashoutTime,
    required this.totalPayoutValue,
    required this.pendingPayoutValue,
    required this.curatorPayoutValue,
    required this.promoted,
    required this.replies,
    required this.bodyLength,
    required this.authorReputation,
    required this.parentAuthor,
    required this.parentPermlink,
    required this.url,
    required this.rootTitle,
    required this.beneficiaries,
    required this.maxAcceptedPayout,
    required this.percentHbd,
    required this.activeVotes,
  });

  factory DiscussionBy.fromJson(Map<String, dynamic> json) {
    return _$DiscussionByFromJson(json);
  }

  final int postId;
  final String author;
  final String permlink;
  final String category;
  final String title;
  final String body;
  @JsonKey(fromJson: _stringOrMap)
  final JsonMetadata jsonMetadata;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime created;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime lastUpdate;
  final int depth;
  final int children;
  final int netRshares;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime cashoutTime;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime lastPayout;
  final String totalPayoutValue;
  final String curatorPayoutValue;
  final String pendingPayoutValue;
  final String promoted;
  final List<String> replies;
  final int bodyLength;
  final double authorReputation;
  final String parentAuthor;
  final String parentPermlink;
  final String url;
  final String rootTitle;
  final List<Beneficiary> beneficiaries;
  final String maxAcceptedPayout;
  final int percentHbd;
  final List<ActiveVote> activeVotes;

  Map<String, dynamic> toJson() => _$DiscussionByToJson(this);

  String get authorperm => '@$author/$permlink';

  @override
  List<Object?> get props => [
        postId,
        author,
        permlink,
        category,
        title,
        body,
        jsonMetadata,
        created,
        depth,
        children,
        curatorPayoutValue,
        pendingPayoutValue,
        promoted,
        replies,
        parentAuthor,
        parentPermlink,
        url,
        beneficiaries,
        maxAcceptedPayout,
        percentHbd,
        netRshares,
        activeVotes
      ];

  @override
  String toString() => 'hive_api.Post @$author/$permlink';

  static JsonMetadata _stringOrMap(dynamic jsonMetadata) {
    final map = jsonMetadata is Map<String, dynamic>
        ? jsonMetadata
        : jsonDecode(jsonMetadata as String) as Map<String, dynamic>;

    return JsonMetadata.fromJson(map);
  }
}
