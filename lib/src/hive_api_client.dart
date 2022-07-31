import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:hive_api/src/models/models.dart';
import 'package:http/http.dart' as http;

enum DiscussionBySort {
  active,
  blog,
  cashout,
  children,
  comments,
  created,
  feed,
  hot,
  promoted,
  trending,
  votes
}

class HiveApiClient {
  /// {@macro hive_api_client}
  HiveApiClient({this.httpClient});

  // TODO(shawnlauzon): Switch to different URLs, https://github.com/LeoFinance/hive-api/issues/1
  static const _baseUrl = 'api.deathwing.me';

  // static const _baseUrl = 'api.hive.blog';

  static const maxNonce = 1 << 32; // max value of Random.secure()

  final Uri _uri = Uri.https(_baseUrl, '/');
  final http.Client? httpClient;
  final Random random = Random.secure();

  /// Return a post with the given parameters.
  /// Throws a NotFoundFailure if a post could not be found.
  Future<Post> getPost({
    required String author,
    required String permlink,
  }) async {
    final bodyJson = await _fetchPostData(
      method: 'bridge.get_post',
      params: {'author': author, 'permlink': permlink},
    );

    return Post.fromJson(bodyJson['result'] as Map<String, dynamic>);
  }

  Future<Map<String, dynamic>> _fetchPostData({
    required String method,
    dynamic params,
  }) async {
    // print('hive_api.fetch > $method $params');
    final response =
        await _httpPost(_uri, body: _buildBody(method: method, params: params));

    if (response.statusCode != 200) {
      throw ContentRequestFailure(statusCode: response.statusCode);
    }

    final bodyJson = jsonDecode(response.body) as Map<String, dynamic>;

    if (bodyJson['error'] != null) {
      final error = bodyJson['error'] as Map<String, dynamic>;
      if ([-32602, -31999].contains(error['code'])) {
        throw NotFoundFailure(error['data'].toString());
      } else {
        throw JsonRpcError(bodyJson['error'] as Map<String, dynamic>);
      }
    }
    return bodyJson;
  }

  String _buildBody({required String method, dynamic params}) {
    final body = <String, dynamic>{
      'jsonrpc': '2.0',
      'method': method,
      'id': random.nextInt(maxNonce)
    };
    if (params != null) {
      body['params'] = params;
    }
    return jsonEncode(body);
  }

  /// Return a discussion with the given parameters.
  /// Throws a NotFoundFailure if a post could not be found.
  Future<Discussion> getDiscussion({
    required String author,
    required String permlink,
  }) async {
    final bodyJson = await _fetchPostData(
      method: 'bridge.get_discussion',
      params: {'author': author, 'permlink': permlink},
    );

    return Discussion.fromJson(bodyJson['result'] as Map<String, dynamic>);
  }

  /// Return a discussion with the given parameters.
  /// Throws a NotFoundFailure if a post could not be found.
  Future<List<DiscussionBy>> getDiscussionsBy(
    DiscussionBySort sort, {
    required String tag,
    int? limit,
    List<String>? filterTags,
    List<String>? selectAuthors,
    List<String>? selectTags,
    int? truncateBody,
  }) async {
    final params = _buildParamsObj(<String, dynamic>{
      'tag': tag,
      'limit': limit,
      'filter_tags': filterTags,
      'select_authors': selectAuthors,
      'select_tags': selectTags
    });

    final bodyJson = await _fetchPostData(
      method: 'condenser_api.get_discussions_by_${sort.name}',
      params: [params],
    );

    final list = bodyJson['result'] as List<dynamic>;

    return [
      for (final f in list) DiscussionBy.fromJson(f as Map<String, dynamic>),
    ];
  }

  Object _buildParamsObj(Map<String, dynamic> params) {
    return <String, dynamic>{
      for (final e in params.entries)
        if (e.value != null) e.key: e.value
    };
  }

  Future<List<Post>> getRepliesByLastUpdate({
    required String startParentAuthor,
    String? startPermlink = '',
    int? limit,
  }) async {
    final params = <dynamic>[startParentAuthor, startPermlink];
    if (limit != null) {
      params.add(limit);
    }
    final bodyJson = await _fetchPostData(
      method: 'bridge.get_replies_by_last_update',
      params: params,
    );

    final list = bodyJson['result'] as List<dynamic>;

    return [for (final f in list) Post.fromJson(f as Map<String, dynamic>)];
  }

  Future<Profile> getProfile(String account) async {
    final bodyJson = await _fetchPostData(
      method: 'bridge.get_profile',
      params: {'account': account},
    );

    return Profile.fromJson(bodyJson['result'] as Map<String, dynamic>);
  }

  Future<FollowCount> getFollowCount(String account) async {
    final bodyJson = await _fetchPostData(
      method: 'condenser_api.get_follow_count',
      params: [account],
    );

    return FollowCount.fromJson(bodyJson['result'] as Map<String, dynamic>);
  }

  Future<List<Following>> getFollowing(
    String account, {
    String? start,
    String? type,
    int? limit,
  }) async {
    final bodyJson = await _fetchPostData(
      method: 'condenser_api.get_following',
      params: [account, start, type, limit],
    );

    final list = bodyJson['result'] as List<dynamic>;

    return [
      for (final f in list) Following.fromJson(f as Map<String, dynamic>)
    ];
  }

  Future<List<Following>> getFollowers(
    String account, {
    String? start,
    String? type,
    int? limit,
  }) async {
    final bodyJson = await _fetchPostData(
      method: 'condenser_api.get_followers',
      params: [account, start, type, limit],
    );

    final list = bodyJson['result'] as List<dynamic>;
    return [
      for (final f in list) Following.fromJson(f as Map<String, dynamic>)
    ];
  }

  Future<DatabaseGlobalProperties> getDatabaseGlobalProperties() async {
    final bodyJson = await _fetchPostData(
      method: 'database_api.get_dynamic_global_properties',
    );

    return DatabaseGlobalProperties.fromJson(
      bodyJson['result'] as Map<String, dynamic>,
    );
  }

  Future<List<Account>> getAccounts(List<String> usernames) async {
    final bodyJson = await _fetchPostData(
      method: 'condenser_api.get_accounts',
      params: [usernames],
    );

    final list = bodyJson['result'] as List<dynamic>;
    return [for (final a in list) Account.fromJson(a as Map<String, dynamic>)];
  }

  Future<List<AccountReputation>> getAccountReputations(
    String accountLowerBounds, {
    int? limit,
  }) async {
    final params = <String, dynamic>{'account_lower_bound': accountLowerBounds};

    if (limit != null) {
      params['limit'] = limit;
    }

    final bodyJson = await _fetchPostData(
      method: 'reputation_api.get_account_reputations',
      params: params,
    );

    final json = bodyJson['result'] as Map<String, dynamic>;
    final list = json['reputations'] as List<dynamic>;

    return [
      for (final a in list)
        AccountReputation.fromJson(a as Map<String, dynamic>)
    ];
  }

  Future<List<AccountHistoryEntry>> getAccountHistory(
    String accountName, {
    int start = 0,
    int size = 20,
    int? operationFilterLow,
    int? operationFilterHigh,
  }) async {
    if (operationFilterHigh != null && operationFilterLow == null) {
      throw Exception(
        'Must set operationFilterLow if operationFilterHigh is set',
      );
    }
    final params = [accountName, start, size];
    if (operationFilterLow != null) {
      params.add(operationFilterLow);
    }
    if (operationFilterHigh != null) {
      params.add(operationFilterHigh);
    }

    final bodyJson = await _fetchPostData(
      method: 'condenser_api.get_account_history',
      params: params,
    );

    final json = bodyJson['result'] as List<dynamic>;

    // See samples/accounts_history.json
    return [
      for (final entry in json)
        AccountHistoryEntry.fromJson(entry as List<dynamic>)
    ];
  }

  Future<List<Vote>> listVotes({
    required String voter,
    String? author,
    String? permlink,
    int? limit,
  }) async {
    final bodyJson = await _fetchPostData(
      method: 'database_api.list_votes',
      params: <String, dynamic>{
        'start': [voter, author ?? '', permlink ?? ''],
        'limit': limit,
        'order': 'by_voter_comment'
      },
    );

    final result = bodyJson['result'] as Map<String, dynamic>;
    final votes = result['votes'] as List<dynamic>;
    return [
      for (final vote in votes) Vote.fromJson(vote as Map<String, dynamic>)
    ];
  }

  Future<List<String>> lookupAccounts(
    String lowerBoundName, {
    int? limit,
  }) async {
    final bodyJson = await _fetchPostData(
      method: 'condenser_api.lookup_accounts',
      params: [lowerBoundName, limit],
    );

    final list = bodyJson['result'] as List<dynamic>;
    return [for (final a in list) a as String];
  }

  Future<List<AccountNotification>> getAccountNotifications(
    String account, {
    int? limit,
  }) async {
    if (limit != null && limit > 100) {
      throw const InvalidParametersException('Limit cannot exceed 100');
    }

    final bodyJson = await _fetchPostData(
      method: 'bridge.account_notifications',
      params: {'account': account, 'limit': limit},
    );

    final list = bodyJson['result'] as List<dynamic>;
    return [
      for (final an in list)
        AccountNotification.fromJson(an as Map<String, dynamic>)
    ];
  }

  Future<UnreadNotifications> getUnreadNotifications(String account) async {
    final bodyJson = await _fetchPostData(
      method: 'bridge.unread_notifications',
      params: {'account': account},
    );

    return UnreadNotifications.fromJson(
      bodyJson['result'] as Map<String, dynamic>,
    );
  }

  Future<http.Response> _httpPost(
    Uri url, {
    Map<String, String>? headers,
    String? body,
    Encoding? encoding,
  }) {
    return httpClient != null
        ? httpClient!
            .post(url, headers: headers, body: body, encoding: encoding)
        : http.post(url, headers: headers, body: body, encoding: encoding);
  }
}

class InvalidParametersException implements Exception {
  const InvalidParametersException(this.message);

  final String message;

  @override
  String toString() => 'InvalidParametersException: $message';
}

/// Exception thrown when call fails.
class ContentRequestFailure implements Exception {
  const ContentRequestFailure({required this.statusCode});

  final int statusCode;

  @override
  String toString() {
    return 'ContentRequestFailure: HTTP $statusCode received';
  }
}

class NotFoundFailure implements Exception {
  const NotFoundFailure(this.message);

  final String message;

  @override
  String toString() => 'NotFoundFailure: $message';
}

class JsonRpcError implements Exception {
  JsonRpcError(Map<String, dynamic> errorObj)
      : code = errorObj['code'] as int,
        message = errorObj['message'] as String,
        data = errorObj['data'];

  final int code;
  final String message;
  final dynamic data;

  @override
  String toString() => 'JsonRpcError ($code) $message: $data';
}
