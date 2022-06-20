import 'package:equatable/equatable.dart';
import 'package:hive_api/src/helpers.dart';
import 'package:hive_api/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Post extends Equatable {
  const Post({
    required this.postId,
    required this.author,
    required this.permlink,
    required this.category,
    required this.title,
    required this.body,
    required this.jsonMetadata,
    required this.created,
    required this.updated,
    required this.depth,
    required this.children,
    required this.netRshares,
    required this.isPaidout,
    required this.payoutAt,
    required this.payout,
    required this.pendingPayoutValue,
    required this.authorPayoutValue,
    required this.curatorPayoutValue,
    required this.promoted,
    required this.replies,
    this.bodyLength,
    this.authorReputation,
    required this.stats,
    this.parentAuthor,
    this.parentPermlink,
    required this.url,
    this.rootTitle,
    required this.beneficiaries,
    required this.maxAcceptedPayout,
    required this.percentHbd,
    required this.activeVotes,
    required this.blacklists,
    this.community,
    this.communityTitle,
    this.authorRole,
    this.authorTitle,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return _$PostFromJson(json);
  }

  final int postId;
  final String author;
  final String permlink;
  final String category;
  final String title;
  final String body;

  @JsonKey(fromJson: _fromJsonMetadata)
  final JsonMetadata jsonMetadata;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime created;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime updated;
  final int depth;
  final int children;
  final int netRshares;
  final bool isPaidout;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime payoutAt;
  final double payout;
  final String pendingPayoutValue;
  final String authorPayoutValue;
  final String curatorPayoutValue;
  final String promoted;
  final List<String> replies;
  final int? bodyLength;
  final double? authorReputation;
  final PostStats stats;
  final String? parentAuthor;
  final String? parentPermlink;
  final String url;
  final String? rootTitle;
  final List<Beneficiary> beneficiaries;
  final String maxAcceptedPayout;
  final int percentHbd;
  final List<ActiveVote> activeVotes;
  final List<String> blacklists;
  final String? community;
  final String? communityTitle;
  final String? authorRole;
  final String? authorTitle;

  Map<String, dynamic> toJson() => _$PostToJson(this);

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

  static JsonMetadata _fromJsonMetadata(dynamic json) => json is String
      ? JsonMetadata.empty
      : JsonMetadata.fromJson(json as Map<String, dynamic>);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PostStats {
  const PostStats({
    required this.hide,
    required this.gray,
    required this.totalVotes,
    required this.flagWeight,
    this.isPinned,
  });

  factory PostStats.fromJson(Map<String, dynamic> json) =>
      _$PostStatsFromJson(json);

  final bool hide;
  final bool gray;
  final num totalVotes;
  final num flagWeight;
  final bool? isPinned;

  Map<String, dynamic> toJson() => _$PostStatsToJson(this);
}
