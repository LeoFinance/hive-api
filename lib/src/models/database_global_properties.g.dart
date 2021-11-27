// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_global_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatabaseGlobalProperties _$DatabaseGlobalPropertiesFromJson(
        Map<String, dynamic> json) =>
    DatabaseGlobalProperties(
      id: json['id'] as int,
      headBlockNumber: json['head_block_number'] as int,
      headBlockId: json['head_block_id'] as String,
      time: DateTime.parse(json['time'] as String),
      currentWitness: json['current_witness'] as String,
      totalPow: json['total_pow'] as int,
      numPowWitnesses: json['num_pow_witnesses'] as int,
      virtualSupply: CurrentHbdSupply.fromJson(
          json['virtual_supply'] as Map<String, dynamic>),
      currentSupply: CurrentHbdSupply.fromJson(
          json['current_supply'] as Map<String, dynamic>),
      initHbdSupply: CurrentHbdSupply.fromJson(
          json['init_hbd_supply'] as Map<String, dynamic>),
      currentHbdSupply: CurrentHbdSupply.fromJson(
          json['current_hbd_supply'] as Map<String, dynamic>),
      totalVestingFundHive: CurrentHbdSupply.fromJson(
          json['total_vesting_fund_hive'] as Map<String, dynamic>),
      totalVestingShares: CurrentHbdSupply.fromJson(
          json['total_vesting_shares'] as Map<String, dynamic>),
      totalRewardFundHive: CurrentHbdSupply.fromJson(
          json['total_reward_fund_hive'] as Map<String, dynamic>),
      totalRewardShares2: json['total_reward_shares2'] as String,
      pendingRewardedVestingShares: CurrentHbdSupply.fromJson(
          json['pending_rewarded_vesting_shares'] as Map<String, dynamic>),
      pendingRewardedVestingHive: CurrentHbdSupply.fromJson(
          json['pending_rewarded_vesting_hive'] as Map<String, dynamic>),
      hbdInterestRate: json['hbd_interest_rate'] as int,
      hbdPrintRate: json['hbd_print_rate'] as int,
      maximumBlockSize: json['maximum_block_size'] as int,
      requiredActionsPartitionPercent:
          json['required_actions_partition_percent'] as int,
      currentAslot: json['current_aslot'] as int,
      recentSlotsFilled: json['recent_slots_filled'] as String,
      participationCount: json['participation_count'] as int,
      lastIrreversibleBlockNum: json['last_irreversible_block_num'] as int,
      votePowerReserveRate: json['vote_power_reserve_rate'] as int,
      delegationReturnPeriod: json['delegation_return_period'] as int,
      reverseAuctionSeconds: json['reverse_auction_seconds'] as int,
      availableAccountSubsidies: json['available_account_subsidies'] as int,
      hbdStopPercent: json['hbd_stop_percent'] as int,
      hbdStartPercent: json['hbd_start_percent'] as int,
      nextMaintenanceTime:
          DateTime.parse(json['next_maintenance_time'] as String),
      lastBudgetTime: DateTime.parse(json['last_budget_time'] as String),
      nextDailyMaintenanceTime:
          DateTime.parse(json['next_daily_maintenance_time'] as String),
      contentRewardPercent: json['content_reward_percent'] as int,
      vestingRewardPercent: json['vesting_reward_percent'] as int,
      spsFundPercent: json['sps_fund_percent'] as int,
      spsIntervalLedger: CurrentHbdSupply.fromJson(
          json['sps_interval_ledger'] as Map<String, dynamic>),
      downvotePoolPercent: json['downvote_pool_percent'] as int,
      currentRemoveThreshold: json['current_remove_threshold'] as int,
      earlyVotingSeconds: json['early_voting_seconds'] as int,
      midVotingSeconds: json['mid_voting_seconds'] as int,
      maxConsecutiveRecurrentTransferFailures:
          json['max_consecutive_recurrent_transfer_failures'] as int,
      maxRecurrentTransferEndDate:
          json['max_recurrent_transfer_end_date'] as int,
      minRecurrentTransfersRecurrence:
          json['min_recurrent_transfers_recurrence'] as int,
      maxOpenRecurrentTransfers: json['max_open_recurrent_transfers'] as int,
    );

Map<String, dynamic> _$DatabaseGlobalPropertiesToJson(
        DatabaseGlobalProperties instance) =>
    <String, dynamic>{
      'id': instance.id,
      'head_block_number': instance.headBlockNumber,
      'head_block_id': instance.headBlockId,
      'time': instance.time.toIso8601String(),
      'current_witness': instance.currentWitness,
      'total_pow': instance.totalPow,
      'num_pow_witnesses': instance.numPowWitnesses,
      'virtual_supply': instance.virtualSupply.toJson(),
      'current_supply': instance.currentSupply.toJson(),
      'init_hbd_supply': instance.initHbdSupply.toJson(),
      'current_hbd_supply': instance.currentHbdSupply.toJson(),
      'total_vesting_fund_hive': instance.totalVestingFundHive.toJson(),
      'total_vesting_shares': instance.totalVestingShares.toJson(),
      'total_reward_fund_hive': instance.totalRewardFundHive.toJson(),
      'total_reward_shares2': instance.totalRewardShares2,
      'pending_rewarded_vesting_shares':
          instance.pendingRewardedVestingShares.toJson(),
      'pending_rewarded_vesting_hive':
          instance.pendingRewardedVestingHive.toJson(),
      'hbd_interest_rate': instance.hbdInterestRate,
      'hbd_print_rate': instance.hbdPrintRate,
      'maximum_block_size': instance.maximumBlockSize,
      'required_actions_partition_percent':
          instance.requiredActionsPartitionPercent,
      'current_aslot': instance.currentAslot,
      'recent_slots_filled': instance.recentSlotsFilled,
      'participation_count': instance.participationCount,
      'last_irreversible_block_num': instance.lastIrreversibleBlockNum,
      'vote_power_reserve_rate': instance.votePowerReserveRate,
      'delegation_return_period': instance.delegationReturnPeriod,
      'reverse_auction_seconds': instance.reverseAuctionSeconds,
      'available_account_subsidies': instance.availableAccountSubsidies,
      'hbd_stop_percent': instance.hbdStopPercent,
      'hbd_start_percent': instance.hbdStartPercent,
      'next_maintenance_time': instance.nextMaintenanceTime.toIso8601String(),
      'last_budget_time': instance.lastBudgetTime.toIso8601String(),
      'next_daily_maintenance_time':
          instance.nextDailyMaintenanceTime.toIso8601String(),
      'content_reward_percent': instance.contentRewardPercent,
      'vesting_reward_percent': instance.vestingRewardPercent,
      'sps_fund_percent': instance.spsFundPercent,
      'sps_interval_ledger': instance.spsIntervalLedger.toJson(),
      'downvote_pool_percent': instance.downvotePoolPercent,
      'current_remove_threshold': instance.currentRemoveThreshold,
      'early_voting_seconds': instance.earlyVotingSeconds,
      'mid_voting_seconds': instance.midVotingSeconds,
      'max_consecutive_recurrent_transfer_failures':
          instance.maxConsecutiveRecurrentTransferFailures,
      'max_recurrent_transfer_end_date': instance.maxRecurrentTransferEndDate,
      'min_recurrent_transfers_recurrence':
          instance.minRecurrentTransfersRecurrence,
      'max_open_recurrent_transfers': instance.maxOpenRecurrentTransfers,
    };

CurrentHbdSupply _$CurrentHbdSupplyFromJson(Map<String, dynamic> json) =>
    CurrentHbdSupply(
      amount: json['amount'] as String,
      precision: json['precision'] as int,
      nai: json['nai'] as String,
    );

Map<String, dynamic> _$CurrentHbdSupplyToJson(CurrentHbdSupply instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'precision': instance.precision,
      'nai': instance.nai,
    };
