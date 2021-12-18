// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['id'] as int,
      name: json['name'] as String,
      owner: Active.fromJson(json['owner'] as Map<String, dynamic>),
      active: Active.fromJson(json['active'] as Map<String, dynamic>),
      posting: Active.fromJson(json['posting'] as Map<String, dynamic>),
      memoKey: json['memo_key'] as String,
      jsonMetadata:
          Account._jsonMetadataFromJson(json['json_metadata'] as String),
      postingJsonMetadata: Account._jsonMetadataFromJson(
          json['posting_json_metadata'] as String),
      proxy: json['proxy'] as String,
      lastOwnerUpdate: DateTime.parse(json['last_owner_update'] as String),
      lastAccountUpdate: DateTime.parse(json['last_account_update'] as String),
      created: DateTime.parse(json['created'] as String),
      mined: json['mined'] as bool,
      recoveryAccount: json['recovery_account'] as String,
      lastAccountRecovery:
          DateTime.parse(json['last_account_recovery'] as String),
      resetAccount: json['reset_account'] as String,
      commentCount: json['comment_count'] as int,
      lifetimeVoteCount: json['lifetime_vote_count'] as int,
      postCount: json['post_count'] as int,
      canVote: json['can_vote'] as bool,
      votingManabar:
          Manabar.fromJson(json['voting_manabar'] as Map<String, dynamic>),
      downvoteManabar:
          Manabar.fromJson(json['downvote_manabar'] as Map<String, dynamic>),
      votingPower: json['voting_power'] as int,
      balance: json['balance'] as String,
      savingsBalance: json['savings_balance'] as String,
      hbdBalance: json['hbd_balance'] as String,
      hbdSeconds: json['hbd_seconds'] as String,
      hbdSecondsLastUpdate:
          DateTime.parse(json['hbd_seconds_last_update'] as String),
      hbdLastInterestPayment:
          DateTime.parse(json['hbd_last_interest_payment'] as String),
      savingsHbdBalance: json['savings_hbd_balance'] as String,
      savingsHbdSeconds: json['savings_hbd_seconds'] as String,
      savingsHbdSecondsLastUpdate:
          DateTime.parse(json['savings_hbd_seconds_last_update'] as String),
      savingsHbdLastInterestPayment:
          DateTime.parse(json['savings_hbd_last_interest_payment'] as String),
      savingsWithdrawRequests: json['savings_withdraw_requests'] as int,
      rewardHbdBalance: json['reward_hbd_balance'] as String,
      rewardHiveBalance: json['reward_hive_balance'] as String,
      rewardVestingBalance: json['reward_vesting_balance'] as String,
      rewardVestingHive: json['reward_vesting_hive'] as String,
      vestingShares: json['vesting_shares'] as String,
      delegatedVestingShares: json['delegated_vesting_shares'] as String,
      receivedVestingShares: json['received_vesting_shares'] as String,
      vestingWithdrawRate: json['vesting_withdraw_rate'] as String,
      postVotingPower: json['post_voting_power'] as String,
      nextVestingWithdrawal:
          DateTime.parse(json['next_vesting_withdrawal'] as String),
      withdrawn: json['withdrawn'] as int,
      toWithdraw: json['to_withdraw'] as int,
      withdrawRoutes: json['withdraw_routes'] as int,
      pendingTransfers: json['pending_transfers'] as int,
      curationRewards: json['curation_rewards'] as int,
      postingRewards: json['posting_rewards'] as int,
      proxiedVsfVotes: (json['proxied_vsf_votes'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      witnessesVotedFor: json['witnesses_voted_for'] as int,
      lastPost: DateTime.parse(json['last_post'] as String),
      lastRootPost: DateTime.parse(json['last_root_post'] as String),
      lastVoteTime: DateTime.parse(json['last_vote_time'] as String),
      postBandwidth: json['post_bandwidth'] as int,
      pendingClaimedAccounts: json['pending_claimed_accounts'] as int,
      governanceVoteExpirationTs:
          DateTime.parse(json['governance_vote_expiration_ts'] as String),
      delayedVotes: json['delayed_votes'] as List<dynamic>,
      openRecurrentTransfers: json['open_recurrent_transfers'] as int,
      vestingBalance: json['vesting_balance'] as String,
      reputation: json['reputation'] as String,
      transferHistory: json['transfer_history'] as List<dynamic>,
      marketHistory: json['market_history'] as List<dynamic>,
      postHistory: json['post_history'] as List<dynamic>,
      voteHistory: json['vote_history'] as List<dynamic>,
      otherHistory: json['other_history'] as List<dynamic>,
      witnessVotes: (json['witness_votes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tagsUsage: json['tags_usage'] as List<dynamic>,
      guestBloggers: json['guest_bloggers'] as List<dynamic>,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner.toJson(),
      'active': instance.active.toJson(),
      'posting': instance.posting.toJson(),
      'memo_key': instance.memoKey,
      'json_metadata': Account._jsonMetadataToJson(instance.jsonMetadata),
      'posting_json_metadata':
          Account._jsonMetadataToJson(instance.postingJsonMetadata),
      'proxy': instance.proxy,
      'last_owner_update': instance.lastOwnerUpdate.toIso8601String(),
      'last_account_update': instance.lastAccountUpdate.toIso8601String(),
      'created': instance.created.toIso8601String(),
      'mined': instance.mined,
      'recovery_account': instance.recoveryAccount,
      'last_account_recovery': instance.lastAccountRecovery.toIso8601String(),
      'reset_account': instance.resetAccount,
      'comment_count': instance.commentCount,
      'lifetime_vote_count': instance.lifetimeVoteCount,
      'post_count': instance.postCount,
      'can_vote': instance.canVote,
      'voting_manabar': instance.votingManabar.toJson(),
      'downvote_manabar': instance.downvoteManabar.toJson(),
      'voting_power': instance.votingPower,
      'balance': instance.balance,
      'savings_balance': instance.savingsBalance,
      'hbd_balance': instance.hbdBalance,
      'hbd_seconds': instance.hbdSeconds,
      'hbd_seconds_last_update':
          instance.hbdSecondsLastUpdate.toIso8601String(),
      'hbd_last_interest_payment':
          instance.hbdLastInterestPayment.toIso8601String(),
      'savings_hbd_balance': instance.savingsHbdBalance,
      'savings_hbd_seconds': instance.savingsHbdSeconds,
      'savings_hbd_seconds_last_update':
          instance.savingsHbdSecondsLastUpdate.toIso8601String(),
      'savings_hbd_last_interest_payment':
          instance.savingsHbdLastInterestPayment.toIso8601String(),
      'savings_withdraw_requests': instance.savingsWithdrawRequests,
      'reward_hbd_balance': instance.rewardHbdBalance,
      'reward_hive_balance': instance.rewardHiveBalance,
      'reward_vesting_balance': instance.rewardVestingBalance,
      'reward_vesting_hive': instance.rewardVestingHive,
      'vesting_shares': instance.vestingShares,
      'delegated_vesting_shares': instance.delegatedVestingShares,
      'received_vesting_shares': instance.receivedVestingShares,
      'vesting_withdraw_rate': instance.vestingWithdrawRate,
      'post_voting_power': instance.postVotingPower,
      'next_vesting_withdrawal':
          instance.nextVestingWithdrawal.toIso8601String(),
      'withdrawn': instance.withdrawn,
      'to_withdraw': instance.toWithdraw,
      'withdraw_routes': instance.withdrawRoutes,
      'pending_transfers': instance.pendingTransfers,
      'curation_rewards': instance.curationRewards,
      'posting_rewards': instance.postingRewards,
      'proxied_vsf_votes': instance.proxiedVsfVotes,
      'witnesses_voted_for': instance.witnessesVotedFor,
      'last_post': instance.lastPost.toIso8601String(),
      'last_root_post': instance.lastRootPost.toIso8601String(),
      'last_vote_time': instance.lastVoteTime.toIso8601String(),
      'post_bandwidth': instance.postBandwidth,
      'pending_claimed_accounts': instance.pendingClaimedAccounts,
      'governance_vote_expiration_ts':
          instance.governanceVoteExpirationTs.toIso8601String(),
      'delayed_votes': instance.delayedVotes,
      'open_recurrent_transfers': instance.openRecurrentTransfers,
      'vesting_balance': instance.vestingBalance,
      'reputation': instance.reputation,
      'transfer_history': instance.transferHistory,
      'market_history': instance.marketHistory,
      'post_history': instance.postHistory,
      'vote_history': instance.voteHistory,
      'other_history': instance.otherHistory,
      'witness_votes': instance.witnessVotes,
      'tags_usage': instance.tagsUsage,
      'guest_bloggers': instance.guestBloggers,
    };

Active _$ActiveFromJson(Map<String, dynamic> json) => Active(
      weightThreshold: json['weight_threshold'] as int,
      accountAuths: (json['account_auths'] as List<dynamic>)
          .map((e) => e as List<dynamic>)
          .toList(),
      keyAuths: (json['key_auths'] as List<dynamic>)
          .map((e) => e as List<dynamic>)
          .toList(),
    );

Map<String, dynamic> _$ActiveToJson(Active instance) => <String, dynamic>{
      'weight_threshold': instance.weightThreshold,
      'account_auths': instance.accountAuths,
      'key_auths': instance.keyAuths,
    };

AccountMetadata _$AccountMetadataFromJson(Map<String, dynamic> json) =>
    AccountMetadata(
      profileImage: Uri.parse(json['profile_image'] as String),
      about: json['about'] as String,
      location: json['location'] as String,
      name: json['name'] as String,
      version: json['version'] as num?,
      coverImage: json['cover_image'] == null
          ? null
          : Uri.parse(json['cover_image'] as String),
    );

Map<String, dynamic> _$AccountMetadataToJson(AccountMetadata instance) =>
    <String, dynamic>{
      'profile_image': instance.profileImage.toString(),
      'about': instance.about,
      'location': instance.location,
      'name': instance.name,
      'version': instance.version,
      'cover_image': instance.coverImage?.toString(),
    };

Manabar _$ManabarFromJson(Map<String, dynamic> json) => Manabar(
      currentMana: json['current_mana'] as String,
      lastUpdateTime: json['last_update_time'] as int,
    );

Map<String, dynamic> _$ManabarToJson(Manabar instance) => <String, dynamic>{
      'current_mana': instance.currentMana,
      'last_update_time': instance.lastUpdateTime,
    };
