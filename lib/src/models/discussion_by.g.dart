// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discussion_by.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscussionBy _$DiscussionByFromJson(Map<String, dynamic> json) => DiscussionBy(
      postId: json['post_id'] as int,
      author: json['author'] as String,
      permlink: json['permlink'] as String,
      category: json['category'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      jsonMetadata: DiscussionBy._stringOrMap(json['json_metadata']),
      created: forceUtcDate(json['created'] as String),
      lastUpdate: forceUtcDate(json['last_update'] as String),
      depth: json['depth'] as int,
      children: json['children'] as int,
      netRshares: json['net_rshares'] as int,
      lastPayout: forceUtcDate(json['last_payout'] as String),
      cashoutTime: forceUtcDate(json['cashout_time'] as String),
      totalPayoutValue: json['total_payout_value'] as String,
      pendingPayoutValue: json['pending_payout_value'] as String,
      curatorPayoutValue: json['curator_payout_value'] as String,
      promoted: json['promoted'] as String,
      replies:
          (json['replies'] as List<dynamic>).map((e) => e as String).toList(),
      bodyLength: json['body_length'] as int,
      authorReputation: (json['author_reputation'] as num).toDouble(),
      parentAuthor: json['parent_author'] as String,
      parentPermlink: json['parent_permlink'] as String,
      url: json['url'] as String,
      rootTitle: json['root_title'] as String,
      beneficiaries: (json['beneficiaries'] as List<dynamic>)
          .map((e) => Beneficiary.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxAcceptedPayout: json['max_accepted_payout'] as String,
      percentHbd: json['percent_hbd'] as int,
      activeVotes: (json['active_votes'] as List<dynamic>)
          .map((e) => ActiveVote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiscussionByToJson(DiscussionBy instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'author': instance.author,
      'permlink': instance.permlink,
      'category': instance.category,
      'title': instance.title,
      'body': instance.body,
      'json_metadata': instance.jsonMetadata.toJson(),
      'created': stripUtcZ(instance.created),
      'last_update': stripUtcZ(instance.lastUpdate),
      'depth': instance.depth,
      'children': instance.children,
      'net_rshares': instance.netRshares,
      'cashout_time': stripUtcZ(instance.cashoutTime),
      'last_payout': stripUtcZ(instance.lastPayout),
      'total_payout_value': instance.totalPayoutValue,
      'curator_payout_value': instance.curatorPayoutValue,
      'pending_payout_value': instance.pendingPayoutValue,
      'promoted': instance.promoted,
      'replies': instance.replies,
      'body_length': instance.bodyLength,
      'author_reputation': instance.authorReputation,
      'parent_author': instance.parentAuthor,
      'parent_permlink': instance.parentPermlink,
      'url': instance.url,
      'root_title': instance.rootTitle,
      'beneficiaries': instance.beneficiaries.map((e) => e.toJson()).toList(),
      'max_accepted_payout': instance.maxAcceptedPayout,
      'percent_hbd': instance.percentHbd,
      'active_votes': instance.activeVotes.map((e) => e.toJson()).toList(),
    };
