import 'dart:convert';
import 'dart:io';
import 'package:hive_bridge_api/hive_bridge_api.dart';
import 'package:test/test.dart';

void main() {
  group('Discussion', () {
    group('fromJson', () {
      test('decodes from JSON', () async {
        final json = await File('test/helpers/fake_discussion.json')
            .readAsString()
            .then(jsonDecode);

        expect(
            Discussion.fromJson(json),
            isA<Discussion>()
                .having((d) => d.root, 'root', isNotNull)
                .having((d) => d.root.author, 'root author', 'edicted')
                .having((d) => d.root.permlink, 'root permlink',
                    'market-watch-bitcoin-posts-very-rare-signal')
                .having((d) => d.root.children, 'children length', 18));
      });

      test('contains correct items', () async {
        final json = await File('test/helpers/fake_discussion.json')
            .readAsString()
            .then(jsonDecode);

        expect(
            Discussion.fromJson(json),
            isA<Discussion>()
                .having((d) => d.comments, 'comments length', hasLength(18)));
      });
    });
  });
}
