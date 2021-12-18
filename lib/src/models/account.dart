import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

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

  static AccountMetadata _jsonMetadataFromJson(String json) {
    return jsonDecode(json) as AccountMetadata;
  }

  static String _jsonMetadataToJson(AccountMetadata profile) {
    return profile.toString();
  }

  final int id;
  final String name;
  final Active owner;
  final Active active;
  final Active posting;
  final String memoKey;
  @JsonKey(fromJson: _jsonMetadataFromJson, toJson: _jsonMetadataToJson)
  final AccountMetadata jsonMetadata;
  @JsonKey(fromJson: _jsonMetadataFromJson, toJson: _jsonMetadataToJson)
  final AccountMetadata postingJsonMetadata;
  final String proxy;
  final DateTime lastOwnerUpdate;
  final DateTime lastAccountUpdate;
  final DateTime created;
  final bool mined;
  final String recoveryAccount;
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
  final DateTime hbdSecondsLastUpdate;
  final DateTime hbdLastInterestPayment;
  final String savingsHbdBalance;
  final String savingsHbdSeconds;
  final DateTime savingsHbdSecondsLastUpdate;
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
  final DateTime nextVestingWithdrawal;
  final int withdrawn;
  final int toWithdraw;
  final int withdrawRoutes;
  final int pendingTransfers;
  final int curationRewards;
  final int postingRewards;
  final List<int> proxiedVsfVotes;
  final int witnessesVotedFor;
  final DateTime lastPost;
  final DateTime lastRootPost;
  final DateTime lastVoteTime;
  final int postBandwidth;
  final int pendingClaimedAccounts;
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
class AccountMetadata {
  AccountMetadata(
      {required this.profileImage,
      required this.about,
      required this.location,
      required this.name,
      this.version,
      this.coverImage});

  final Uri profileImage;
  final String about;
  final String location;
  final String name;
  final num? version;
  final Uri? coverImage;

  factory AccountMetadata.fromJson(Map<String, dynamic> json) =>
      _$AccountMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$AccountMetadataToJson(this);
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
