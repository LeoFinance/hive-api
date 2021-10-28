// ignore_for_file: prefer_const_constructors
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
    late BridgeApiClient bridgeApiClient;

    // setUpAll(() {
    //   registerFallbackValue<Uri>(FakeUri());
    // });

    setUp(() {
      httpClient = MockClient();
      bridgeApiClient = BridgeApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(BridgeApiClient(), isNotNull);
      });
    });

    group('getPost', () {
      const author = 'leofinance';
      const permlink = 'another-great-post';
      final hiveBlogUri = Uri.https('api.hive.blog', '/');

      test('makes correct http request', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn('{}');
        when(httpClient.post(hiveBlogUri, body: anyNamed('body')))
            .thenAnswer((_) async => response);
        try {
          await bridgeApiClient.getPost(author, permlink);
        } catch (_) {}
        verify(
          httpClient.post(hiveBlogUri, body: {
            'jsonrpc': '2.0',
            'method': 'bridge.get_post',
            'params': {author: author, permlink: permlink},
            'id': 1
          }),
        ).called(1);
      });

      test('throws ContentRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(400);
        when(httpClient.post(hiveBlogUri, body: anyNamed('body')))
            .thenAnswer((_) async => response);
        expect(
          bridgeApiClient.getPost(author, permlink),
          throwsA(isA<ContentRequestFailure>()),
        );
      });

      test('throws PostNotFoundFailure on empty response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn('{}');
        when(httpClient.post(hiveBlogUri, body: anyNamed('body')))
            .thenAnswer((_) async => response);
        expect(
          bridgeApiClient.getPost(author, permlink),
          throwsA(isA<PostNotFoundFailure>()),
        );
      });

      test('returns Post on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
            await File('test/helpers/fake_post.json').readAsString());
        when(httpClient.post(hiveBlogUri, body: anyNamed('body')))
            .thenAnswer((_) async => response);
        final actual = await bridgeApiClient.getPost(author, permlink);
        expect(
            actual,
            isA<Post>()
                .having((p) => p.postId, 'postId', 106348197)
                .having((p) => p.author, 'author', 'leofinance')
                .having((p) => p.permlink, 'permlink',
                    'leofinance-weekly-dev-update-6-or-mobile-app-v0-0-10-marketing-major-ido-details-and-v2-migration')
                .having((p) => p.activeVotes, 'activeVotes',
                    contains(ActiveVote(rshares: 121838205, voter: 'jshafto')))
                .having((p) => p.jsonMetadata.app, 'jsonMetadata',
                    "leofinance/0.2"));
      });
    });
  });
}
