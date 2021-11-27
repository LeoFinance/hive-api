import 'package:json_annotation/json_annotation.dart';

part 'database_global_properties.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DatabaseGlobalProperties {
  DatabaseGlobalProperties({
    required this.id,
    required this.headBlockNumber,
    required this.headBlockId,
    required this.time,
    required this.currentWitness,
    required this.totalPow,
    required this.numPowWitnesses,
    required this.virtualSupply,
    required this.currentSupply,
    required this.initHbdSupply,
    required this.currentHbdSupply,
    required this.totalVestingFundHive,
    required this.totalVestingShares,
    required this.totalRewardFundHive,
    required this.totalRewardShares2,
    required this.pendingRewardedVestingShares,
    required this.pendingRewardedVestingHive,
    required this.hbdInterestRate,
    required this.hbdPrintRate,
    required this.maximumBlockSize,
    required this.requiredActionsPartitionPercent,
    required this.currentAslot,
    required this.recentSlotsFilled,
    required this.participationCount,
    required this.lastIrreversibleBlockNum,
    required this.votePowerReserveRate,
    required this.delegationReturnPeriod,
    required this.reverseAuctionSeconds,
    required this.availableAccountSubsidies,
    required this.hbdStopPercent,
    required this.hbdStartPercent,
    required this.nextMaintenanceTime,
    required this.lastBudgetTime,
    required this.nextDailyMaintenanceTime,
    required this.contentRewardPercent,
    required this.vestingRewardPercent,
    required this.spsFundPercent,
    required this.spsIntervalLedger,
    required this.downvotePoolPercent,
    required this.currentRemoveThreshold,
    required this.earlyVotingSeconds,
    required this.midVotingSeconds,
    required this.maxConsecutiveRecurrentTransferFailures,
    required this.maxRecurrentTransferEndDate,
    required this.minRecurrentTransfersRecurrence,
    required this.maxOpenRecurrentTransfers,
  });

  final int id;
  final int headBlockNumber;
  final String headBlockId;
  final DateTime time;
  final String currentWitness;
  final int totalPow;
  final int numPowWitnesses;
  final CurrentHbdSupply virtualSupply;
  final CurrentHbdSupply currentSupply;
  final CurrentHbdSupply initHbdSupply;
  final CurrentHbdSupply currentHbdSupply;
  final CurrentHbdSupply totalVestingFundHive;
  final CurrentHbdSupply totalVestingShares;
  final CurrentHbdSupply totalRewardFundHive;
  final String totalRewardShares2;
  final CurrentHbdSupply pendingRewardedVestingShares;
  final CurrentHbdSupply pendingRewardedVestingHive;
  final int hbdInterestRate;
  final int hbdPrintRate;
  final int maximumBlockSize;
  final int requiredActionsPartitionPercent;
  final int currentAslot;
  final String recentSlotsFilled;
  final int participationCount;
  final int lastIrreversibleBlockNum;
  final int votePowerReserveRate;
  final int delegationReturnPeriod;
  final int reverseAuctionSeconds;
  final int availableAccountSubsidies;
  final int hbdStopPercent;
  final int hbdStartPercent;
  final DateTime nextMaintenanceTime;
  final DateTime lastBudgetTime;
  final DateTime nextDailyMaintenanceTime;
  final int contentRewardPercent;
  final int vestingRewardPercent;
  final int spsFundPercent;
  final CurrentHbdSupply spsIntervalLedger;
  final int downvotePoolPercent;
  final int currentRemoveThreshold;
  final int earlyVotingSeconds;
  final int midVotingSeconds;
  final int maxConsecutiveRecurrentTransferFailures;
  final int maxRecurrentTransferEndDate;
  final int minRecurrentTransfersRecurrence;
  final int maxOpenRecurrentTransfers;

  factory DatabaseGlobalProperties.fromJson(Map<String, dynamic> json) =>
      _$DatabaseGlobalPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$DatabaseGlobalPropertiesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CurrentHbdSupply {
  CurrentHbdSupply({
    required this.amount,
    required this.precision,
    required this.nai,
  });

  final String amount;
  final int precision;
  final String nai;

  factory CurrentHbdSupply.fromJson(Map<String, dynamic> json) =>
      _$CurrentHbdSupplyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentHbdSupplyToJson(this);
}
