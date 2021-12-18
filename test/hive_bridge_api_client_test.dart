// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:hive_bridge_api/hive_bridge_api.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'hive_bridge_api_client_test.mocks.dart';

@GenerateMocks([http.Client, http.Response, Uri])
void main() {
  group('BridgeApiClient', () {
    late MockClient httpClient;
    late HiveBridgeApiClient bridgeApiClient;

    setUp(() {
      httpClient = MockClient();
      bridgeApiClient = HiveBridgeApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(HiveBridgeApiClient(), isNotNull);
      });
    });

    group('getPost', () {
      const author = 'cwow2';
      const permlink = 'selling-my-hive-goodbye';
      final hiveBlogUri = Uri.https('api.hive.blog', '/');

      test('throws ContentRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(400);
        when(httpClient.post(hiveBlogUri, body: anyNamed('body')))
            .thenAnswer((_) async => response);
        expect(
          bridgeApiClient.getPost(author: author, permlink: permlink),
          throwsA(isA<ContentRequestFailure>()),
        );
      });

      test('throws PostNotFoundFailure on -32602', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(jsonEncode({
          "jsonrpc": "2.0",
          "error": {
            "code": -32602,
            "message": "Invalid parameters",
            "data": "Post cwow2\/selling-my-hive-goodb does not exist"
          },
          "id": 1
        }));
        when(httpClient.post(hiveBlogUri, body: anyNamed('body')))
            .thenAnswer((_) async => response);
        expect(
          bridgeApiClient.getPost(author: author, permlink: permlink),
          throwsA(isA<NotFoundFailure>()),
        );
      });

      test('returns Post on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(jsonEncode({
          "jsonrpc": "2.0",
          "result":
              jsonDecode(await File('test/samples/post.json').readAsString()),
          "id": 1
        }));
        when(httpClient.post(hiveBlogUri, body: anyNamed('body')))
            .thenAnswer((_) async => response);
        final actual =
            await bridgeApiClient.getPost(author: author, permlink: permlink);
        verify(
          // httpClient.post(hiveBlogUri, body: {
          //   'jsonrpc': '2.0',
          //   'method': 'bridge.get_post',
          //   'params': {author: author, permlink: permlink},
          //   'id': 1
          // }),
          // TODO Check more specific
          httpClient.post(hiveBlogUri, body: anyNamed('body')),
        ).called(1);

        expect(
            actual,
            isA<Post>()
                .having((p) => p.postId, 'postId', 107387380)
                .having((p) => p.author, 'author', 'cwow2')
                .having(
                    (p) => p.permlink, 'permlink', 'selling-my-hive-goodbye')
                .having(
                    (p) => p.activeVotes,
                    'activeVotes',
                    contains(ActiveVote(
                        rshares: 4585790624, voter: 'kennyskitchen')))
                .having((p) => p.jsonMetadata.app, 'jsonMetadata',
                    "peakd/2021.09.1"));
      });
    });

    group('getDiscussion', () {
      const author = 'cwow2';
      const permlink = 'selling-my-hive-goodbye';
      final hiveBlogUri = Uri.https('api.hive.blog', '/');

      test('throws ContentRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(400);
        when(httpClient.post(hiveBlogUri, body: anyNamed('body')))
            .thenAnswer((_) async => response);
        expect(
          bridgeApiClient.getPost(author: author, permlink: permlink),
          throwsA(isA<ContentRequestFailure>()),
        );
      });

      test('throws PostNotFoundFailure on -32602', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(jsonEncode({
          "jsonrpc": "2.0",
          "error": {
            "code": -32602,
            "message": "Invalid parameters",
            "data": "Post cwow2\/selling-my-hive-goodb does not exist"
          },
          "id": 1
        }));
        when(httpClient.post(hiveBlogUri, body: anyNamed('body')))
            .thenAnswer((_) async => response);
        expect(
          bridgeApiClient.getPost(author: author, permlink: permlink),
          throwsA(isA<NotFoundFailure>()),
        );
      });

      test('returns Discussion on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(jsonEncode({
          "jsonrpc": "2.0",
          "result": jsonDecode(
              await File('test/samples/discussion.json').readAsString()),
          "id": 1
        }));
        when(httpClient.post(hiveBlogUri, body: anyNamed('body')))
            .thenAnswer((_) async => response);
        final actual = await bridgeApiClient.getDiscussion(
            author: author, permlink: permlink);
        verify(
          // httpClient.post(hiveBlogUri, body: {
          //   'jsonrpc': '2.0',
          //   'method': 'bridge.get_discussion',
          //   'params': {author: author, permlink: permlink},
          //   'id': 1
          // }),
          // TODO Check more specific
          httpClient.post(hiveBlogUri, body: anyNamed('body')),
        ).called(1);

        expect(
            actual,
            isA<Discussion>()
                .having((d) => d.post.postId, 'postId', 107387380)
                .having((d) => d.post.author, 'author', 'cwow2')
                .having((d) => d.post.permlink, 'permlink',
                    'selling-my-hive-goodbye')
                .having((d) => d.comments, 'comments', hasLength(35)));
      });
    });
  });
}
