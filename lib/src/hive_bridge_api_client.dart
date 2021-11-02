import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../hive_bridge_api.dart';

/// Exception thrown when getPost fails.
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

class BridgeApiClient {
  // TODO Switch to different URLs
  static const _baseUrl = 'api.hive.blog';
  final Uri _uri = Uri.https(_baseUrl, '/');
  final http.Client _httpClient;

  /// {@macro lightning_api_client}
  BridgeApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<Post> getPost(String author, String permlink) async {
    final postResponse = await _httpClient.post(_uri,
        body: jsonEncode({
          'jsonrpc': '2.0',
          'method': 'bridge.get_post',
          'params': {'author': author, 'permlink': permlink},
          'id': 1
        }));

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
      return Post.fromJson(jsonDecode(bodyJson['result']));
    } catch (e, s) {
      print('Failed to parse $author - $permlink: $e');
      print(s);
      print('Failed data: $bodyJson');
      throw e;
    }
  }

  Future<Discussion> getDiscussion(String author, String permlink) async {
    final postResponse = await _httpClient.post(_uri,
        body: jsonEncode({
          'jsonrpc': '2.0',
          'method': 'bridge.get_discussion',
          'params': {'author': author, 'permlink': permlink},
          'id': 1
        }));
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
      return Discussion.fromJson(jsonDecode(bodyJson['result']));
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
}
