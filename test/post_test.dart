import 'dart:convert';
import 'dart:io';

import 'package:hive_api/hive_api.dart';
import 'package:test/test.dart';

void main() {
  group('Post', () {
    group('fromJson', () {
      test('decodes from JSON', () async {
        final s = await File('test/samples/post.json').readAsString();
        final json = jsonDecode(s) as Map<String, dynamic>;

        expect(
          Post.fromJson(json),
          isA<Post>().having(
            (c) => c.beneficiaries,
            'beneficiaries',
            [const Beneficiary(account: 'archon-gov', weight: 500)],
          ).having(
            (c) => c.replies,
            'replies',
            <Beneficiary>[],
          ), // always empty
        );
      });

      test('decodes 3Speak content from JSON', () async {
        final s = await File('test/samples/3speak_post.json').readAsString();
        final json = jsonDecode(s) as Map<String, dynamic>;

        expect(
          Post.fromJson(json),
          isA<Post>().having(
            (c) => c.jsonMetadata.video!.info!.title,
            'video',
            r'FTX Valued $25 Billion',
          ),
        );
      });

      test('allows empty beneficiaries', () async {
        final s = await File('test/samples/post.json').readAsString();
        final json = jsonDecode(s) as Map<String, dynamic>;
        json['beneficiaries'] = <Beneficiary>[];

        expect(
          Post.fromJson(json),
          isA<Post>().having(
            (c) => c.beneficiaries,
            'beneficiaries',
            <Beneficiary>[],
          ),
        );
      });
    });

    test('can get authorperm', () async {
      final s = await File('test/samples/post.json').readAsString();
      final json = jsonDecode(s) as Map<String, dynamic>;

      expect(
        Post.fromJson(json),
        isA<Post>().having(
          (c) => c.authorperm,
          'authorperm',
          '@cwow2/selling-my-hive-goodbye',
        ),
      );
    });
  });
}
