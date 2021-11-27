import 'dart:convert';
import 'dart:io';
import 'package:hive_bridge_api/hive_bridge_api.dart';
import 'package:test/test.dart';

void main() {
  group('Post', () {
    group('fromJson', () {
      test('decodes from JSON', () async {
        final json = await File('test/samples/post.json')
            .readAsString()
            .then(jsonDecode);

        expect(
            Post.fromJson(json),
            isA<Post>().having((c) => c.beneficiaries, 'beneficiaries', [
              Beneficiary(account: 'archon-gov', weight: 500)
            ]).having((c) => c.replies, 'replies', []) // always empty
            );
      });

      test('decodes 3Speak content from JSON', () async {
        final json = await File('test/samples/3speak_post.json')
            .readAsString()
            .then(jsonDecode);

        expect(
            Post.fromJson(json),
            isA<Post>().having((c) => c.jsonMetadata.video!.info.title, 'video',
                'FTX Valued \$25 Billion'));
      });

      test('allows empty beneficiaries', () async {
        final json = await File('test/samples/post.json')
            .readAsString()
            .then(jsonDecode);
        json["beneficiaries"] = [];

        expect(Post.fromJson(json),
            isA<Post>().having((c) => c.beneficiaries, 'beneficiaries', []));
      });
    });

    test('can get authorperm', () async {
      final json =
          await File('test/samples/post.json').readAsString().then(jsonDecode);

      expect(
          Post.fromJson(json),
          isA<Post>().having((c) => c.authorperm, 'authorperm',
              '@cwow2/selling-my-hive-goodbye'));
    });
  });
}
