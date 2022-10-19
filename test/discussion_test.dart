import 'dart:convert';
import 'dart:io';
import 'package:leofinance_hive_api/leofinance_hive_api.dart';
import 'package:test/test.dart';

void main() {
  group('Discussion', () {
    group('fromJson', () {
      test('decodes from JSON', () async {
        final s = await File('test/samples/discussion.json').readAsString();
        final json = jsonDecode(s) as Map<String, dynamic>;

        expect(
          Discussion.fromJson(json),
          isA<Discussion>()
              .having((d) => d.post, 'post', isNotNull)
              .having((d) => d.post.author, 'post author', 'cwow2')
              .having(
                (d) => d.post.permlink,
                'post permlink',
                'selling-my-hive-goodbye',
              )
              .having((d) => d.post.children, 'children', 35),
        );
      });

      test('contains correct items', () async {
        final s = await File('test/samples/discussion.json').readAsString();
        final json = jsonDecode(s) as Map<String, dynamic>;

        expect(
          Discussion.fromJson(json),
          isA<Discussion>()
              .having((d) => d.comments, 'comments length', hasLength(35)),
        );
      });
    });
  });
}
