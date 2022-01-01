import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../hive_bridge_api.dart';

class HiveBridgeApiClient {
  // TODO Switch to different URLs
  static const _baseUrl = 'api.hive.blog';
  static const MAX_NONCE = 1 << 32; // max value of Random.secure()
  final Uri _uri = Uri.https(_baseUrl, '/');
  final http.Client _httpClient;
  final Random random = Random.secure();

  /// {@macro lightning_api_client}
  HiveBridgeApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<Post> getPost(
      {required String author, required String permlink}) async {
    final bodyJson = await _fetchPostData(
        method: 'bridge.get_post',
        params: {'author': author, 'permlink': permlink});

    try {
      return Post.fromJson(bodyJson['result']);
    } catch (e, s) {
      print('Failed to parse @$author/$permlink: $e');
      print(s);
      print('Failed data: ${jsonEncode(bodyJson)}');
      throw e;
    }
  }

  Future<Map<String, dynamic>> _fetchPostData(
      {required String method, dynamic params}) async {
    print('hive_api.fetch > $method $params');
    final response = await _httpClient.post(_uri,
        body: _buildBody(method: method, params: params));

    if (response.statusCode != 200) {
      throw ContentRequestFailure(statusCode: response.statusCode);
    }

    final bodyJson = jsonDecode(response.body) as Map<String, dynamic>;

    if (bodyJson['error'] != null) {
      if (bodyJson['error']['code'] == -32602) {
        throw NotFoundFailure(
            'Data not found for method $method with params $params');
      } else {
        throw JsonRpcError(bodyJson['error']);
      }
    }
    return bodyJson;
  }

  String _buildBody({required String method, dynamic params}) {
    var body = {
      'jsonrpc': '2.0',
      'method': method,
      'id': random.nextInt(MAX_NONCE)
    };
    if (params != null) {
      body['params'] = params;
    }
    return jsonEncode(body);
  }

  Future<Discussion> getDiscussion(
      {required String author, required String permlink}) async {
    final bodyJson = await _fetchPostData(
        method: 'bridge.get_discussion',
        params: {'author': author, 'permlink': permlink});

    try {
      return Discussion.fromJson(bodyJson['result']);
    } catch (e, s) {
      print('Failed to parse @$author/$permlink: $e');
      print(s);
      print('Failed data: ${jsonEncode(bodyJson)}');
      throw e;
    }
  }

  Future<List<dynamic>> getFeedJson(
      {required String tag, required String sort}) async {
    final uri = Uri.https(_baseUrl, '/lightning/feeds/$tag/$sort');
    print('GET $uri');
    final postResponse = await _httpClient.get(uri);

    if (postResponse.statusCode != 200) {
      throw ContentRequestFailure(statusCode: postResponse.statusCode);
    }

    return jsonDecode(postResponse.body) as List<dynamic>;
  }

  Future<Profile> getProfile(String account) async {
    final bodyJson = await _fetchPostData(
        method: 'bridge.get_profile', params: {'account': account});

    try {
      return Profile.fromJson(bodyJson['result']);
    } catch (e, s) {
      print('Failed to parse $account: $e');
      print(s);
      print('Failed data: ${jsonEncode(bodyJson)}');
      throw e;
    }
  }

  Future<FollowCount> getFollowCount(String account) async {
    final bodyJson = await _fetchPostData(
        method: 'condenser_api.get_follow_count', params: [account]);

    try {
      return FollowCount.fromJson(bodyJson['result']);
    } catch (e, s) {
      print('Failed to parse $account: $e');
      print(s);
      print('Failed data: ${jsonEncode(bodyJson)}');
      throw e;
    }
  }

  Future<List<Following>> getFollowing(String account,
      {int? start, required String type, int? limit}) async {
    final bodyJson = await _fetchPostData(
        method: 'condenser_api.get_following',
        params: [account, start, type, limit]);

    try {
      final resultList = bodyJson['result'] as List;
      return resultList.map((v) => Following.fromJson(v)).toList();
    } catch (e, s) {
      print('Failed to parse $account: $e');
      print(s);
      print('Failed data: ${jsonEncode(bodyJson)}');
      throw e;
    }
  }

  Future<DatabaseGlobalProperties> getDatabaseGlobalProperties() async {
    final bodyJson = await _fetchPostData(
        method: 'database_api.get_dynamic_global_properties');

    try {
      return DatabaseGlobalProperties.fromJson(bodyJson['result']);
    } catch (e, s) {
      print('Failed to parse: $e');
      print(s);
      print('Failed data: ${jsonEncode(bodyJson)}');
      throw e;
    }
  }

  Future<List<Account>> getAccounts(List<String> usernames) async {
    final bodyJson = await _fetchPostData(
        method: 'condenser_api.get_accounts', params: [usernames]);

    try {
      final list = bodyJson['result'] as List;
      return list.map((d) => Account.fromJson(d)).toList();
    } catch (e, s) {
      print('Failed to parse: $e');
      print(s);
      print('Failed data: ${jsonEncode(bodyJson)}');
      throw e;
    }
  }

  Future<AccountReputations> getAccountReputations(String accountLowerBounds,
      {int? limit}) async {
    final Map<String, dynamic> params = {
      'account_lower_bound': accountLowerBounds
    };

    if (limit != null) {
      params['limit'] = limit;
    }

    final bodyJson = await _fetchPostData(
        method: 'reputation_api.get_account_reputations', params: params);

    print('getAccountReputations ${jsonEncode(bodyJson)}');

    try {
      return AccountReputations.fromJson(bodyJson['result']);
    } catch (e, s) {
      print('Failed to parse: $e');
      print(s);
      print('Failed data: ${jsonEncode(bodyJson)}');
      throw e;
    }
  }

  Future<List<AccountHistoryEntry>> getAccountHistory(String accountName,
      {int start = 0, int size = 20}) async {
    final bodyJson = await _fetchPostData(
        method: 'condenser_api.get_account_history',
        params: [accountName, start, size]);

    try {
      final entries = bodyJson['result'] as List<dynamic>;
      return entries
          .map((entry) => AccountHistoryEntry.fromJson(entry[1]))
          .toList();
    } catch (e, s) {
      print('Failed to parse: $e');
      print(s);
      print('Failed data: ${jsonEncode(bodyJson)}');
      throw e;
    }
  }

  Future<List<Vote>> listVotes(
      {String? voter,
      String? author,
      String? permlink,
      required int limit}) async {
    final bodyJson =
        await _fetchPostData(method: 'database_api.list_votes', params: {
      'start': [voter ?? '', author ?? '', permlink ?? ''],
      'limit': limit,
      'order': 'by_voter_comment'
    });

    try {
      final list = bodyJson['result']['votes'] as List;
      return list.map((d) => Vote.fromJson(d)).toList();
    } catch (e, s) {
      print('Failed to parse: $e');
      print(s);
      print('Failed data: ${jsonEncode(bodyJson)}');
      throw e;
    }
  }

  Future<List<dynamic>> lookupAccounts(String lowerBoundName,
      {int? limit}) async {
    final bodyJson = await _fetchPostData(
        method: 'condenser_api.lookup_accounts',
        params: [lowerBoundName, limit]);

    try {
      return bodyJson['result'] as List<dynamic>;
    } catch (e, s) {
      print('Failed to parse: $e');
      print(s);
      print('Failed data: ${jsonEncode(bodyJson)}');
      throw e;
    }
  }

  Future<List<AccountNotification>> getAccountNotifications(String account,
      {int? limit}) async {
    if (limit != null && limit > 100) {
      throw InvalidParametersException('Limit cannot exceed 100');
    }

    final bodyJson = await _fetchPostData(
        method: 'bridge.account_notifications',
        params: {'account': account, 'limit': limit});

    try {
      final list = bodyJson['result'] as List;
      return list.map((d) => AccountNotification.fromJson(d)).toList();
    } catch (e, s) {
      print('Failed to parse: $e');
      print(s);
      print('Failed data: ${jsonEncode(bodyJson)}');
      throw e;
    }
  }

  Future<UnreadNotifications> getUnreadNotifications(String account) async {
    final bodyJson = await _fetchPostData(
        method: 'bridge.unread_notifications', params: {'account': account});

    try {
      final json = bodyJson['result'];
      return UnreadNotifications.fromJson(json);
    } catch (e, s) {
      print('Failed to parse: $e');
      print(s);
      print('Failed data: ${jsonEncode(bodyJson)}');
      throw e;
    }
  }
}

class InvalidParametersException implements Exception {
  final String message;

  const InvalidParametersException(this.message);

  @override
  String toString() => 'InvalidParametersException: $message';
}

/// Exception thrown when call fails.
class ContentRequestFailure implements Exception {
  final int statusCode;

  const ContentRequestFailure({required this.statusCode});

  @override
  String toString() {
    return 'ContentRequestFailure: HTTP $statusCode received';
  }
}

class NotFoundFailure implements Exception {
  final String message;

  const NotFoundFailure(this.message);

  @override
  String toString() => 'NotFoundFailure: $message';
}

class JsonRpcError implements Exception {
  final int code;
  final String message;
  final Map<String, dynamic> data;

  // {code: -32602, message: Invalid parameters, data: missing a required argument: 'author'}
  JsonRpcError(dynamic errorObj)
      : code = errorObj['code'],
        message = errorObj['message'],
        data = errorObj['data'];

  @override
  String toString() => 'JsonRpcError ($code) $message: $data';
}
