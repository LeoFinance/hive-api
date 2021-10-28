// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      postId: json['post_id'] as int,
      author: json['author'] as String,
      permlink: json['permlink'] as String,
      category: json['category'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      jsonMetadata:
          JsonMetadata.fromJson(json['json_metadata'] as Map<String, dynamic>),
      created: Post._toUTC(json['created'] as String),
      updated: Post._toUTC(json['updated'] as String),
      depth: json['depth'] as int,
      children: json['children'] as int,
      netRshares: json['net_rshares'] as int,
      isPaidout: json['is_paidout'] as bool,
      payoutAt: Post._toUTC(json['payout_at'] as String),
      payout: (json['payout'] as num).toDouble(),
      pendingPayoutValue: json['pending_payout_value'] as String,
      authorPayoutValue: json['author_payout_value'] as String,
      curatorPayoutValue: json['curator_payout_value'] as String,
      promoted: json['promoted'] as String,
      replies:
          (json['replies'] as List<dynamic>).map((e) => e as String).toList(),
      bodyLength: json['body_length'] as int?,
      authorReputation: (json['author_reputation'] as num?)?.toDouble(),
      stats: Stats.fromJson(json['stats'] as Map<String, dynamic>),
      parentAuthor: json['parent_author'] as String?,
      parentPermlink: json['parent_permlink'] as String?,
      url: json['url'] as String,
      rootTitle: json['root_title'] as String?,
      beneficiaries: (json['beneficiaries'] as List<dynamic>)
          .map((e) => Beneficiary.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxAcceptedPayout: json['max_accepted_payout'] as String,
      percentHbd: json['percent_hbd'] as int,
      activeVotes: (json['active_votes'] as List<dynamic>)
          .map((e) => ActiveVote.fromJson(e as Map<String, dynamic>))
          .toList(),
      blacklists: (json['blacklists'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      community: json['community'] as String,
      communityTitle: json['community_title'] as String,
      authorRole: json['author_role'] as String,
      authorTitle: json['author_title'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'post_id': instance.postId,
      'author': instance.author,
      'permlink': instance.permlink,
      'category': instance.category,
      'title': instance.title,
      'body': instance.body,
      'json_metadata': instance.jsonMetadata.toJson(),
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'depth': instance.depth,
      'children': instance.children,
      'net_rshares': instance.netRshares,
      'is_paidout': instance.isPaidout,
      'payout_at': instance.payoutAt.toIso8601String(),
      'payout': instance.payout,
      'pending_payout_value': instance.pendingPayoutValue,
      'author_payout_value': instance.authorPayoutValue,
      'curator_payout_value': instance.curatorPayoutValue,
      'promoted': instance.promoted,
      'replies': instance.replies,
      'body_length': instance.bodyLength,
      'author_reputation': instance.authorReputation,
      'stats': instance.stats.toJson(),
      'parent_author': instance.parentAuthor,
      'parent_permlink': instance.parentPermlink,
      'url': instance.url,
      'root_title': instance.rootTitle,
      'beneficiaries': instance.beneficiaries.map((e) => e.toJson()).toList(),
      'max_accepted_payout': instance.maxAcceptedPayout,
      'percent_hbd': instance.percentHbd,
      'active_votes': instance.activeVotes.map((e) => e.toJson()).toList(),
      'blacklists': instance.blacklists,
      'community': instance.community,
      'community_title': instance.communityTitle,
      'author_role': instance.authorRole,
      'author_title': instance.authorTitle,
    };
