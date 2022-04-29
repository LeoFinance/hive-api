// ignore_for_file: prefer_const_constructors
// ignore_for_file: flutter_style_todos
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:faker/faker.dart';
import 'package:hive_api/hive_api.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'hive_api_client_test.mocks.dart';

@GenerateMocks([http.Client, http.Response, Uri])
void main() {
  group('HiveApiClient', () {
    late MockClient httpClient;
    late HiveApiClient hiveApiClient;

    setUp(() {
      httpClient = MockClient();
      hiveApiClient = HiveApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(HiveApiClient(), isNotNull);
      });
    });

    group('getPost', () {
      const author = 'cwow2';
      const permlink = 'selling-my-hive-goodbye';

      test('throws ContentRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(400);
        when(
          httpClient.post(
            any,
            headers: anyNamed('headers'),
            body: anyNamed('body'),
            encoding: anyNamed('encoding'),
          ),
        ).thenAnswer((_) async => response);
        expect(
          hiveApiClient.getPost(author: author, permlink: permlink),
          throwsA(isA<ContentRequestFailure>()),
        );
      });

      test('throws PostNotFoundFailure on -32602', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode({
            'jsonrpc': '2.0',
            'error': {
              'code': -32602,
              'message': 'Invalid parameters',
              'data': 'Post cwow2/selling-my-hive-goodb does not exist'
            },
            'id': 1
          }),
        );
        when(httpClient.post(any, body: anyNamed('body')))
            .thenAnswer((_) async => response);
        expect(
          hiveApiClient.getPost(author: author, permlink: permlink),
          throwsA(isA<NotFoundFailure>()),
        );
      });

      test('returns Post on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'result':
                jsonDecode(await File('test/samples/post.json').readAsString()),
            'id': 1
          }),
        );
        when(httpClient.post(any, body: anyNamed('body')))
            .thenAnswer((_) async => response);
        expect(
          await hiveApiClient.getPost(author: author, permlink: permlink),
          isA<Post>(),
        );
      });
    });

    group('getDiscussion', () {
      const author = 'cwow2';
      const permlink = 'selling-my-hive-goodbye';

      test('throws ContentRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(400);
        when(httpClient.post(any, body: anyNamed('body')))
            .thenAnswer((_) async => response);
        expect(
          hiveApiClient.getPost(author: author, permlink: permlink),
          throwsA(isA<ContentRequestFailure>()),
        );
      });

      test('throws PostNotFoundFailure on -32602', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode({
            'jsonrpc': '2.0',
            'error': {
              'code': -32602,
              'message': 'Invalid parameters',
              'data': 'Post cwow2/selling-my-hive-goodb does not exist'
            },
            'id': 1
          }),
        );
        when(httpClient.post(any, body: anyNamed('body')))
            .thenAnswer((_) async => response);
        expect(
          hiveApiClient.getPost(author: author, permlink: permlink),
          throwsA(isA<NotFoundFailure>()),
        );
      });

      test('returns Discussion on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'result': jsonDecode(
              await File('test/samples/discussion.json').readAsString(),
            ),
            'id': 1
          }),
        );
        when(httpClient.post(any, body: anyNamed('body')))
            .thenAnswer((_) async => response);
        expect(
          await hiveApiClient.getDiscussion(
            author: author,
            permlink: permlink,
          ),
          isA<Discussion>(),
        );
      });
    });

    group('profile', () {
      final accountName = faker.internet.userName();
      test('returns Profile on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'result': jsonDecode(
              await File('test/samples/profile.json').readAsString(),
            ),
            'id': 1
          }),
        );
        when(
          httpClient.post(
            any,
            body: anyNamed('body'),
            headers: anyNamed('headers'),
            encoding: anyNamed('encoding'),
          ),
        ).thenAnswer((_) async => response);
        expect(
          await hiveApiClient.getProfile(accountName),
          isA<Profile>(),
        );
      });
    });

    group('followCount', () {
      final accountName = faker.internet.userName();
      test('returns FollowCount on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'result': jsonDecode(
              await File('test/samples/follow_count.json').readAsString(),
            ),
            'id': 1
          }),
        );
        when(
          httpClient.post(
            any,
            body: anyNamed('body'),
            headers: anyNamed('headers'),
            encoding: anyNamed('encoding'),
          ),
        ).thenAnswer((_) async => response);
        expect(
          await hiveApiClient.getFollowCount(accountName),
          isA<FollowCount>(),
        );
      });
    });

    group('following', () {
      final accountName = faker.internet.userName();
      test('returns List<Following> on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'result': jsonDecode(
              await File('test/samples/get_following.json').readAsString(),
            ),
            'id': 1
          }),
        );
        when(
          httpClient.post(
            any,
            body: anyNamed('body'),
            headers: anyNamed('headers'),
            encoding: anyNamed('encoding'),
          ),
        ).thenAnswer((_) async => response);
        expect(
          await hiveApiClient.getFollowing(accountName),
          isA<List<Following>>(),
        );
      });
    });

    group('followers', () {
      final accountName = faker.internet.userName();
      test('returns List<Following> on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'result': jsonDecode(
              await File('test/samples/get_followers.json').readAsString(),
            ),
            'id': 1
          }),
        );
        when(
          httpClient.post(
            any,
            body: anyNamed('body'),
            headers: anyNamed('headers'),
            encoding: anyNamed('encoding'),
          ),
        ).thenAnswer((_) async => response);
        expect(
          await hiveApiClient.getFollowers(accountName),
          isA<List<Following>>(),
        );
      });
    });

    group('databaseGlobalProperties', () {
      test('returns DatabaseGlobalProperties on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'result': jsonDecode(
              await File('test/samples/database_global_properties.json')
                  .readAsString(),
            ),
            'id': 1
          }),
        );
        when(
          httpClient.post(
            any,
            body: anyNamed('body'),
            headers: anyNamed('headers'),
            encoding: anyNamed('encoding'),
          ),
        ).thenAnswer((_) async => response);
        expect(
          await hiveApiClient.getDatabaseGlobalProperties(),
          isA<DatabaseGlobalProperties>(),
        );
      });
    });

    group('accounts', () {
      final accountName = faker.internet.userName();
      test('returns List<Account> on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'result': jsonDecode(
              await File('test/samples/accounts.json').readAsString(),
            ),
            'id': 1
          }),
        );
        when(
          httpClient.post(
            any,
            body: anyNamed('body'),
            headers: anyNamed('headers'),
            encoding: anyNamed('encoding'),
          ),
        ).thenAnswer((_) async => response);
        expect(
          await hiveApiClient.getAccounts([accountName]),
          isA<List<Account>>(),
        );
      });
    });

    group('accountReputations', () {
      final accountName = faker.internet.userName();
      test('returns List<AccountReputation> on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'result': jsonDecode(
              await File('test/samples/get_account_reputations.json')
                  .readAsString(),
            ),
            'id': 1
          }),
        );
        when(
          httpClient.post(
            any,
            body: anyNamed('body'),
            headers: anyNamed('headers'),
            encoding: anyNamed('encoding'),
          ),
        ).thenAnswer((_) async => response);
        expect(
          await hiveApiClient.getAccountReputations(accountName),
          isA<List<AccountReputation>>(),
        );
      });
    });

    group('getAccountHistory', () {
      final accountName = faker.internet.userName();
      test('returns List<AccountHistory> on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'result': jsonDecode(
              await File('test/samples/account_history.json').readAsString(),
            ),
            'id': 1
          }),
        );
        when(
          httpClient.post(
            any,
            body: anyNamed('body'),
            headers: anyNamed('headers'),
            encoding: anyNamed('encoding'),
          ),
        ).thenAnswer((_) async => response);
        expect(
          await hiveApiClient.getAccountHistory(accountName),
          isA<List<AccountHistoryEntry>>(),
        );
      });
    });

    group('listVotes', () {
      final accountName = faker.internet.userName();
      test('returns List<Vote> on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'result': jsonDecode(
              await File('test/samples/list_votes.json').readAsString(),
            ),
            'id': 1
          }),
        );
        when(
          httpClient.post(
            any,
            body: anyNamed('body'),
            headers: anyNamed('headers'),
            encoding: anyNamed('encoding'),
          ),
        ).thenAnswer((_) async => response);
        expect(
          await hiveApiClient.listVotes(voter: accountName),
          isA<List<Vote>>(),
        );
      });
    });

    group('lookupAccounts', () {
      final accountName = faker.internet.userName();
      test('returns List<String> on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'result': jsonDecode(
              await File('test/samples/lookup_accounts.json').readAsString(),
            ),
            'id': 1
          }),
        );
        when(
          httpClient.post(
            any,
            body: anyNamed('body'),
            headers: anyNamed('headers'),
            encoding: anyNamed('encoding'),
          ),
        ).thenAnswer((_) async => response);
        expect(
          await hiveApiClient.lookupAccounts(accountName),
          isA<List<String>>(),
        );
      });
    });

    group('accountNotifications', () {
      final accountName = faker.internet.userName();
      test('returns List<AccountNotification> on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'result': jsonDecode(
              await File('test/samples/account_notifications.json')
                  .readAsString(),
            ),
            'id': 1
          }),
        );
        when(
          httpClient.post(
            any,
            body: anyNamed('body'),
            headers: anyNamed('headers'),
            encoding: anyNamed('encoding'),
          ),
        ).thenAnswer((_) async => response);
        expect(
          await hiveApiClient.getAccountNotifications(accountName),
          isA<List<AccountNotification>>(),
        );
      });
    });

    group('unreadNotifications', () {
      final accountName = faker.internet.userName();
      test('returns UnreadNotifications on valid response', () async {
        final response = MockResponse();
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(
          jsonEncode(<String, dynamic>{
            'jsonrpc': '2.0',
            'result': jsonDecode(
              await File('test/samples/unread_notifications.json')
                  .readAsString(),
            ),
            'id': 1
          }),
        );
        when(
          httpClient.post(
            any,
            body: anyNamed('body'),
            headers: anyNamed('headers'),
            encoding: anyNamed('encoding'),
          ),
        ).thenAnswer((_) async => response);
        expect(
          await hiveApiClient.getUnreadNotifications(accountName),
          isA<UnreadNotifications>(),
        );
      });
    });
  });
}
