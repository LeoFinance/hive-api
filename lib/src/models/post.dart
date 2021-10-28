import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'post.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Post extends Equatable {
  Post(
      {required this.postId,
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
      required this.community,
      required this.communityTitle,
      required this.authorRole,
      required this.authorTitle});

  static DateTime _toUTC(String json) {
    return DateTime.parse(json + (json.endsWith('Z') ? '' : 'Z'));
  }

  final int postId;
  final String author;
  final String permlink;
  final String category;
  final String title;
  final String body;
  final JsonMetadata jsonMetadata;
  @JsonKey(fromJson: _toUTC)
  final DateTime created;
  @JsonKey(fromJson: _toUTC)
  final DateTime updated;
  final int depth;
  final int children;
  final int netRshares;
  final bool isPaidout;
  @JsonKey(fromJson: _toUTC)
  final DateTime payoutAt;
  final double payout;
  final String pendingPayoutValue;
  final String authorPayoutValue;
  final String curatorPayoutValue;
  final String promoted;
  final List<String> replies;
  final int? bodyLength;
  final double? authorReputation;
  final Stats stats;
  final String? parentAuthor;
  final String? parentPermlink;
  final String url;
  final String? rootTitle;
  final List<Beneficiary> beneficiaries;
  final String maxAcceptedPayout;
  final int percentHbd;
  final List<ActiveVote> activeVotes;
  final List<String> blacklists;
  final String community;
  final String communityTitle;
  final String authorRole;
  final String authorTitle;

  factory Post.fromJson(Map<String, dynamic> json) {
    try {
      return _$PostFromJson(json);
    } catch (e, s) {
      print('Failed parsing content: $e');
      print(s);
      throw e;
    }
  }

  Map<String, dynamic> toJson() => _$PostToJson(this);

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
}
