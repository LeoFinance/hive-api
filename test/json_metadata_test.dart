import 'dart:convert';
import 'dart:io';

import 'samples/samples.dart';
import 'package:hive_bridge_api/hive_bridge_api.dart';
import 'package:test/test.dart';
import 'package:faker/faker.dart';

void main() {
  group('JsonMetadata', () {
    group('fromJson', () {
      test('decodes from JSON', () async {
        JsonMetadata jsonMetadata = await sampleJsonMetadata();
        Map<String, dynamic> json = {
          "app": jsonMetadata.app,
          "format": jsonMetadata.format,
          "tags": jsonMetadata.tags,
          "links": jsonMetadata.links,
          "image": jsonMetadata.image
        };

        expect(
            JsonMetadata.fromJson(json),
            isA<JsonMetadata>()
                .having((jm) => jm.app, 'app', jsonMetadata.app)
                .having((jm) => jm.format, 'format', jsonMetadata.format)
                .having((jm) => jm.tags, 'tags', jsonMetadata.tags));
      });

      test('accepts single String as image', () async {
        final json = (await File('test/samples/post.json')
            .readAsString()
            .then(jsonDecode))["json_metadata"];

        final fakeUrl = faker.internet.httpsUrl();

        json["image"] = fakeUrl;

        expect(JsonMetadata.fromJson(json),
            isA<JsonMetadata>().having((jm) => jm.image, 'image', fakeUrl));
      });
    });
  });
}
