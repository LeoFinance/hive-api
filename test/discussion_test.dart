import 'dart:convert';
import 'dart:io';
import 'package:hive_api/hive_api.dart';
import 'package:test/test.dart';
import 'samples/samples.dart';

void main() {
  group('Discussion', () {
    group('fromJson', () {
      test('decodes from JSON', () async {
        final json = await File('test/samples/discussion.json')
            .readAsString()
            .then(jsonDecode);

        expect(
            Discussion.fromJson(json),
            isA<Discussion>()
                .having((d) => d.post, 'post', isNotNull)
                .having((d) => d.post.author, 'post author', 'cwow2')
                .having((d) => d.post.permlink, 'post permlink',
                    'selling-my-hive-goodbye')
                .having((d) => d.post.children, 'children', 35));
      });

      test('contains correct items', () async {
        final json = await File('test/samples/discussion.json')
            .readAsString()
            .then(jsonDecode);

        expect(
            Discussion.fromJson(json),
            isA<Discussion>()
                .having((d) => d.comments, 'comments length', hasLength(35)));
      });
    });
  });
}
