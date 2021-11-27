import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:hive_bridge_api/src/models/account_reputations.dart';
import 'package:hive_bridge_api/src/models/follow_count.dart';
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

  Future<Post> getPost(String author, String permlink) async {
    final postResponse = await _httpClient.post(_uri,
        body: _buildBody(
            method: 'bridge.get_post',
            params: {'author': author, 'permlink': permlink}));

    if (postResponse.statusCode != 200) {
      throw ContentRequestFailure(statusCode: postResponse.statusCode);
    }

    final bodyJson = jsonDecode(postResponse.body) as Map<String, dynamic>;

    try {
      return Post.fromJson(bodyJson['result']);
    } catch (e, s) {
      print('Failed to parse $author - $permlink: $e');
      print(s);
      print('Failed data: $bodyJson');
      throw e;
    }
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

  Future<Discussion> getDiscussion(String author, String permlink) async {
    final postResponse = await _httpClient.post(_uri,
        body: _buildBody(
            method: 'bridge.get_discussion',
            params: {'author': author, 'permlink': permlink}));
    if (postResponse.statusCode != 200) {
      throw ContentRequestFailure(statusCode: postResponse.statusCode);
    }

    final bodyJson = jsonDecode(postResponse.body);

    if (bodyJson['error'] != null) {
      if (bodyJson['error']['code'] == -32602) {
        throw PostNotFoundFailure(author, permlink);
      } else {
        throw JsonRpcError(bodyJson['error']);
      }
    }

    try {
      return Discussion.fromJson(bodyJson['result']);
    } catch (e, s) {
      print('Failed to parse $author - $permlink: $e');
      print(s);
      print('Failed data: $bodyJson');
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
    final postResponse = await _httpClient.post(_uri,
        body: _buildBody(
            method: 'bridge.get_profile', params: {'account': account}));
    if (postResponse.statusCode != 200) {
      throw ContentRequestFailure(statusCode: postResponse.statusCode);
    }

    final bodyJson = jsonDecode(postResponse.body);

    if (bodyJson['error'] != null) {
      if (bodyJson['error']['code'] == -32602) {
        throw ProfileNotFoundFailure(account);
      } else {
        throw JsonRpcError(bodyJson['error']);
      }
    }

    try {
      return Profile.fromJson(bodyJson['result']);
    } catch (e, s) {
      print('Failed to parse $account: $e');
      print(s);
      print('Failed data: $bodyJson');
      throw e;
    }
  }

  Future<FollowCount> getFollowCount(String account) async {
    final postResponse = await _httpClient.post(_uri,
        body: _buildBody(
            method: 'condenser_api.get_follow_count', params: [account]));
    if (postResponse.statusCode != 200) {
      throw ContentRequestFailure(statusCode: postResponse.statusCode);
    }

    final bodyJson = jsonDecode(postResponse.body);

    if (bodyJson['error'] != null) {
      if (bodyJson['error']['code'] == -32602) {
        throw ProfileNotFoundFailure(account);
      } else {
        throw JsonRpcError(bodyJson['error']);
      }
    }

    try {
      return FollowCount.fromJson(bodyJson['result']);
    } catch (e, s) {
      print('Failed to parse $account: $e');
      print(s);
      print('Failed data: $bodyJson');
      throw e;
    }
  }

  Future<List<Following>> getFollowing(
      {required String account,
      int? start,
      required String type,
      int? limit}) async {
    final postResponse = await _httpClient.post(_uri,
        body: _buildBody(
            method: 'condenser_api.get_following',
            params: [account, start, type, limit]));
    if (postResponse.statusCode != 200) {
      throw ContentRequestFailure(statusCode: postResponse.statusCode);
    }

    final bodyJson = jsonDecode(postResponse.body);

    if (bodyJson['error'] != null) {
      if (bodyJson['error']['code'] == -32602) {
        throw ProfileNotFoundFailure(account);
      } else {
        throw JsonRpcError(bodyJson['error']);
      }
    }

    try {
      final resultList = bodyJson['result'] as List;
      return resultList.map((v) => Following.fromJson(v)).toList();
    } catch (e, s) {
      print('Failed to parse $account: $e');
      print(s);
      print('Failed data: $bodyJson');
      throw e;
    }
  }

  Future<DatabaseGlobalProperties> getDatabaseGlobalProperties() async {
    final postResponse = await _httpClient.post(_uri,
        body: _buildBody(method: 'database_api.get_dynamic_global_properties'));
    if (postResponse.statusCode != 200) {
      throw ContentRequestFailure(statusCode: postResponse.statusCode);
    }

    final bodyJson = jsonDecode(postResponse.body);

    try {
      return DatabaseGlobalProperties.fromJson(bodyJson['result']);
    } catch (e, s) {
      print('Failed to parse: $e');
      print(s);
      print('Failed data: $bodyJson');
      throw e;
    }
  }

  Future<AccountReputations> getAccountReputations(
      {String? accountLowerBounds, int? limit}) async {
    var params = {};
    if (accountLowerBounds != null) {
      params['account_lower_bound'] = accountLowerBounds;
    }
    if (limit != null) {
      params['limit'] = limit;
    }

    final postResponse = await _httpClient.post(_uri,
        body: _buildBody(
            method: 'reputation_api.get_account_reputations', params: params));
    if (postResponse.statusCode != 200) {
      throw ContentRequestFailure(statusCode: postResponse.statusCode);
    }

    final bodyJson = jsonDecode(postResponse.body);

    print('getAccountReputations $bodyJson');

    try {
      return AccountReputations.fromJson(bodyJson['result']);
    } catch (e, s) {
      print('Failed to parse: $e');
      print(s);
      print('Failed data: $bodyJson');
      throw e;
    }
  }

  Future<List<dynamic>> lookupAccounts(
      {String? lowerBoundName, int? limit}) async {
    var params = [lowerBoundName, limit];

    final postResponse = await _httpClient.post(_uri,
        body: _buildBody(
            method: 'condenser_api.lookup_accounts', params: params));
    if (postResponse.statusCode != 200) {
      throw ContentRequestFailure(statusCode: postResponse.statusCode);
    }

    final bodyJson = jsonDecode(postResponse.body);

    print('getAccountReputations $bodyJson');

    try {
      return bodyJson['result'] as List<dynamic>;
    } catch (e, s) {
      print('Failed to parse: $e');
      print(s);
      print('Failed data: $bodyJson');
      throw e;
    }
  }
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

/// Exception thrown when post is not found.
class PostNotFoundFailure implements Exception {
  final String author;
  final String permlink;

  PostNotFoundFailure(this.author, this.permlink);

  @override
  String toString() => 'PostNotFoundFailure: $author - $permlink';
}

/// Exception thrown when profile is not found.
class ProfileNotFoundFailure implements Exception {
  final String account;

  ProfileNotFoundFailure(this.account);

  @override
  String toString() => 'ProfileNotFoundFailure: $account';
}

class JsonRpcError implements Exception {
  final int code;
  final String message;
  final String data;

  // {code: -32602, message: Invalid parameters, data: missing a required argument: 'author'}
  JsonRpcError(dynamic errorObj)
      : code = errorObj['code'],
        message = errorObj['message'],
        data = errorObj['data'];

  @override
  String toString() => 'JsonRpcError ($code) $message: $data';
}

class FeedNotFoundFailure implements Exception {
  final String tag;
  final String sort;

  FeedNotFoundFailure({required this.tag, required this.sort});

  @override
  String toString() => 'FeedNotFoundFailure: $tag / $sort';
}
