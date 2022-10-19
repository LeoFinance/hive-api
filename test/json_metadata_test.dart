import 'dart:convert';
import 'dart:io';

import 'package:faker/faker.dart';
import 'package:leofinance_hive_api/leofinance_hive_api.dart';
import 'package:test/test.dart';

import 'samples/samples.dart';

void main() {
  group('JsonMetadata', () {
    group('fromJson', () {
      test('decodes from JSON', () async {
        final jsonMetadata = await sampleJsonMetadata();
        final json = <String, dynamic>{
          'app': jsonMetadata.app,
          'format': jsonMetadata.format,
          'tags': jsonMetadata.tags,
          'image': jsonMetadata.image
        };

        expect(
          JsonMetadata.fromJson(json),
          isA<JsonMetadata>()
              .having((jm) => jm.app, 'app', jsonMetadata.app)
              .having((jm) => jm.format, 'format', jsonMetadata.format)
              .having((jm) => jm.tags, 'tags', jsonMetadata.tags),
        );
      });

      test('accepts single String as image', () async {
        final s = await File('test/samples/post.json').readAsString();
        final json = jsonDecode(s) as Map<String, dynamic>;
        final jsonMetadata = json['json_metadata'] as Map<String, dynamic>;

        final fakeUrl = faker.internet.httpsUrl();

        jsonMetadata['image'] = [fakeUrl];

        expect(
          JsonMetadata.fromJson(jsonMetadata),
          isA<JsonMetadata>().having((jm) => jm.image, 'image', [fakeUrl]),
        );
      });
    });
  });
}
