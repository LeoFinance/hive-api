import 'dart:convert';
import 'dart:io';
import 'package:hive_bridge_api/hive_bridge_api.dart';
import 'package:test/test.dart';

void main() {
  group('Post', () {
    group('fromJson', () {
      test('decodes from JSON', () async {
        final json = await File('test/helpers/fake_post.json')
            .readAsString()
            .then(jsonDecode);

        expect(
            Post.fromJson(json),
            isA<Post>()
                .having((c) => c.beneficiaries, 'beneficiaries', []).having(
                    (c) => c.replies, 'replies', []) // always empty
            );
      });

      test('decodes 3Speak content from JSON', () async {
        final json = await File('test/helpers/fake_3speak_post.json')
            .readAsString()
            .then(jsonDecode);

        expect(
            Post.fromJson(json),
            isA<Post>().having((c) => c.jsonMetadata.video!.info.title, 'video',
                'FTX Valued \$25 Billion'));
      });

      test('allows empty beneficiaries', () async {
        final json = await File('test/helpers/fake_post.json')
            .readAsString()
            .then(jsonDecode);
        json["beneficiaries"] = [];

        expect(Post.fromJson(json),
            isA<Post>().having((c) => c.beneficiaries, 'beneficiaries', []));
      });
    });
  });
}
