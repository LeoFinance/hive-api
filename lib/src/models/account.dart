import 'package:json_annotation/json_annotation.dart';

import '../helpers.dart';

part 'account.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Account {
  Account({
    required this.id,
    required this.name,
    required this.owner,
    required this.active,
    required this.posting,
    required this.memoKey,
    required this.jsonMetadata,
    required this.postingJsonMetadata,
    required this.proxy,
    required this.lastOwnerUpdate,
    required this.lastAccountUpdate,
    required this.created,
    required this.mined,
    required this.recoveryAccount,
    required this.lastAccountRecovery,
    required this.resetAccount,
    required this.commentCount,
    required this.lifetimeVoteCount,
    required this.postCount,
    required this.canVote,
    required this.votingManabar,
    required this.downvoteManabar,
    required this.votingPower,
    required this.balance,
    required this.savingsBalance,
    required this.hbdBalance,
    required this.hbdSeconds,
    required this.hbdSecondsLastUpdate,
    required this.hbdLastInterestPayment,
    required this.savingsHbdBalance,
    required this.savingsHbdSeconds,
    required this.savingsHbdSecondsLastUpdate,
    required this.savingsHbdLastInterestPayment,
    required this.savingsWithdrawRequests,
    required this.rewardHbdBalance,
    required this.rewardHiveBalance,
    required this.rewardVestingBalance,
    required this.rewardVestingHive,
    required this.vestingShares,
    required this.delegatedVestingShares,
    required this.receivedVestingShares,
    required this.vestingWithdrawRate,
    required this.postVotingPower,
    required this.nextVestingWithdrawal,
    required this.withdrawn,
    required this.toWithdraw,
    required this.withdrawRoutes,
    required this.pendingTransfers,
    required this.curationRewards,
    required this.postingRewards,
    required this.proxiedVsfVotes,
    required this.witnessesVotedFor,
    required this.lastPost,
    required this.lastRootPost,
    required this.lastVoteTime,
    required this.postBandwidth,
    required this.pendingClaimedAccounts,
    required this.governanceVoteExpirationTs,
    required this.delayedVotes,
    required this.openRecurrentTransfers,
    required this.vestingBalance,
    required this.reputation,
    required this.transferHistory,
    required this.marketHistory,
    required this.postHistory,
    required this.voteHistory,
    required this.otherHistory,
    required this.witnessVotes,
    required this.tagsUsage,
    required this.guestBloggers,
  });

  final int id;
  final String name;
  final Active owner;
  final Active active;
  final Active posting;
  final String memoKey;
  final String jsonMetadata;
  final String postingJsonMetadata;
  final String proxy;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime lastOwnerUpdate;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime lastAccountUpdate;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime created;
  final bool mined;
  final String recoveryAccount;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime lastAccountRecovery;
  final String resetAccount;
  final int commentCount;
  final int lifetimeVoteCount;
  final int postCount;
  final bool canVote;
  final Manabar votingManabar;
  final Manabar downvoteManabar;
  final int votingPower;
  final String balance;
  final String savingsBalance;
  final String hbdBalance;
  final String hbdSeconds;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime hbdSecondsLastUpdate;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime hbdLastInterestPayment;
  final String savingsHbdBalance;
  final String savingsHbdSeconds;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime savingsHbdSecondsLastUpdate;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime savingsHbdLastInterestPayment;
  final int savingsWithdrawRequests;
  final String rewardHbdBalance;
  final String rewardHiveBalance;
  final String rewardVestingBalance;
  final String rewardVestingHive;
  final String vestingShares;
  final String delegatedVestingShares;
  final String receivedVestingShares;
  final String vestingWithdrawRate;
  final String postVotingPower;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime nextVestingWithdrawal;
  @JsonKey(fromJson: forceInt)
  final int withdrawn;
  @JsonKey(fromJson: forceInt)
  final int toWithdraw;
  final int withdrawRoutes;
  final int pendingTransfers;
  final int curationRewards;
  final int postingRewards;
  final List<dynamic> proxiedVsfVotes;
  final int witnessesVotedFor;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime lastPost;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime lastRootPost;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime lastVoteTime;
  final int postBandwidth;
  final int pendingClaimedAccounts;
  @JsonKey(fromJson: forceUtcDate, toJson: stripUtcZ)
  final DateTime governanceVoteExpirationTs;
  final List<dynamic> delayedVotes;
  final int openRecurrentTransfers;
  final String vestingBalance;
  final String reputation;
  final List<dynamic> transferHistory;
  final List<dynamic> marketHistory;
  final List<dynamic> postHistory;
  final List<dynamic> voteHistory;
  final List<dynamic> otherHistory;
  final List<String> witnessVotes;
  final List<dynamic> tagsUsage;
  final List<dynamic> guestBloggers;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Active {
  Active({
    required this.weightThreshold,
    required this.accountAuths,
    required this.keyAuths,
  });

  final int weightThreshold;
  final List<List<dynamic>> accountAuths;
  final List<List<dynamic>> keyAuths;

  factory Active.fromJson(Map<String, dynamic> json) => _$ActiveFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Manabar {
  Manabar({
    required this.currentMana,
    required this.lastUpdateTime,
  });

  final String currentMana;
  final int lastUpdateTime;

  factory Manabar.fromJson(Map<String, dynamic> json) =>
      _$ManabarFromJson(json);

  Map<String, dynamic> toJson() => _$ManabarToJson(this);
}
